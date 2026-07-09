//
//  TimerEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

/// An emitter that streams the time (only) in 24-hour format with seconds.
struct TimeEmitter: DashboardEmitter {
    
    let id = UUID()
    
    let name = "Timer emitter"

    var publisher: AnyPublisher<String, Never>

    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        self.publisher = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .map {
                formatter.string(from: $0)
            }
            .eraseToAnyPublisher()
    }
    
}

#if canImport(Playgrounds)
import Playgrounds

#Playground {
    
    Task {
        let publisher = TimeEmitter().publisher

        for try await value in publisher.values {
            print("-> \(value)")
        }
    }

}
#endif
