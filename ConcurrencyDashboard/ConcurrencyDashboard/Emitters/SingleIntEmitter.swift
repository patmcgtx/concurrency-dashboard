//
//  SingleIntSource.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

struct SingleIntEmitter: DashboardEmitter {
    
    let id = UUID()
    
    let value: Int
    
    let name: String = "Single int source"

    var publisher: AnyPublisher<String, Never> {
        Just(value)
            .map { String($0) }
            .eraseToAnyPublisher()
    }
}

import Playgrounds

#Playground {
    
    Task {
        let publisher = SingleIntEmitter(value: 42).publisher

        for try await value in publisher.values {
            print("-> \(value)")
        }
    }

}
