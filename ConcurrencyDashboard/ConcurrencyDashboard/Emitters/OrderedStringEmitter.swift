//
//  OrderedStringEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

/// An emitter that streams the given strings, spaced by the given time interval.
struct OrderedStringEmitter: DashboardEmitter {
    
    let id = UUID()
    
    let name: String
    
    let publisher: AnyPublisher<String, Never>

    /// The string values to stream
    let values: [String]
    
    /// The time interval between emitting values
    let interval: TimeInterval
    
    init(
        name: String,
        values: [String],
        interval: TimeInterval
    ) {
        self.name = name
        self.values = values
        self.interval = interval
        
        let timer = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()

        self.publisher = values.publisher
            .zip(timer) { value, _ in
                return value
            }
            .eraseToAnyPublisher()
    }
    
}

#if canImport(Playgrounds)
import Playgrounds

#Playground {
    
    Task {
        let strings = ["one", "two", "three"]
        let publisher = OrderedStringEmitter(
            name: "Numberz",
            values: strings,
            interval: 1.5
        ).publisher

        for await value in publisher.values {
            print("-> \(value)")
        }
    }

}
#endif
