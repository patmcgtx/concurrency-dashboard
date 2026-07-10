//
//  SingleIntEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

/// Emits a single int value as a string
struct SingleIntEmitter: DashboardEmitter {
    
    let id = UUID()
        
    let name: String

    var publisher: AnyPublisher<String, Never>
    
    /// The int value to emit (as a string)
    let value: Int

    init(name: String, value: Int) {
        self.name = name
        self.value = value
        self.publisher = Just(value)
            .map { String($0) }
            .eraseToAnyPublisher()
    }
}

#if canImport(Playgrounds)
import Playgrounds

#Playground {
    
    Task {
        let publisher = SingleIntEmitter(
            name: "Just 42",
            value: 42
        ).publisher

        for await value in publisher.values {
            print("-> \(value)")
        }
    }

}
#endif
