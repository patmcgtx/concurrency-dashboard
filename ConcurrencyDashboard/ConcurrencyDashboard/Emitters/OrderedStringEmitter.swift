//
//  OrderedStringEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

struct OrderedStringEmitter: DashboardEmitter {
    
    let id = UUID()
    
    let name = "String array emitter"
    
    let values: [String]
    
    var publisher: AnyPublisher<String, Never> {
        let timer = Timer.publish(every: 1.2, on: .main, in: .common)
            .autoconnect()

        // TODO patmcg the playground below works fine,
        // but in SwiftUI, it alternates between the first two values.
        return values.publisher
            .zip(timer) { value, _ in
                return value
            }
            .eraseToAnyPublisher()
    }
    
}

import Playgrounds

#Playground {
    
    Task {
        let strings = ["one", "two", "three"]
        let publisher = OrderedStringEmitter(values: strings).publisher

        for try await value in publisher.values {
            print("-> \(value)")
        }
    }

}
