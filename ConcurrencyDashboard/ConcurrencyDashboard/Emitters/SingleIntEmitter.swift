//
//  SingleIntSource.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

/// Emits a single int value as a string
struct SingleIntEmitter: DashboardEmitter {
    
    let id = UUID()
        
    let name: String = "Single int source"

    var publisher: AnyPublisher<String, Never>
    
    /// The int value to emit (as a string)
    let value: Int

    init(value: Int) {
        self.value = value
        self.publisher = Just(value)
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
