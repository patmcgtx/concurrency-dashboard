//
//  TimerEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

struct TimeEmitter: DashboardEmitter {
    
    let id = UUID()
    
    let name = "Timer emitter"
    
    var publisher: AnyPublisher<String, Never> {
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .map{
                $0.formatted(
                    date: Date.FormatStyle.DateStyle.omitted,
                    time: Date.FormatStyle.TimeStyle.standard
                )
            }
            .eraseToAnyPublisher()
    }
    
}

import Playgrounds

import Playgrounds

#Playground {
    
    Task {
        let publisher = TimeEmitter().publisher

        for try await value in publisher.values {
            print("-> \(value)")
        }
    }

}
