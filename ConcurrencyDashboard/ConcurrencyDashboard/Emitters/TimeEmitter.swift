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
    
    let name: String
    
    /// See https://www.nsdateformatter.com
    let timeFormat: String

    var publisher: AnyPublisher<String, Never>

    init(
        name: String,
        timeFormat: String = "HH:mm:ss",
        intervalSecs: TimeInterval = 1.0
    ) {
        
        self.timeFormat = timeFormat
        self.name = name
        
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat
        
        self.publisher = Timer
            .publish(
                every: intervalSecs,
                on: .main,
                in: .common
            )
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
        let publisher = TimeEmitter(
            name: "Time",
            timeFormat: "SSS",
            intervalSecs: 0.25
        ).publisher

        for await value in publisher.values {
            print("-> \(value)")
        }
    }

}

#endif
