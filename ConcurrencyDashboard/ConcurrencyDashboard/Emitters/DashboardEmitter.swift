//
//  DashboardEmitter.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import Foundation
import Combine

/// A source of data for a dashboard item
protocol DashboardEmitter {

    /// Emitters have an id of concrete type UUID since protocols can't exactly implement Identifiable or Hashable
    var id: UUID { get }
    
    /// A short, descriptive name for the emitter
    var name: String { get }

    /// The Combine publisher for this data source.
    /// To work with the expected SwiftUI view, the resulting data must be a String value with no errors.
    var publisher: AnyPublisher<String, Never> { get }
}
