//
//  DashboardView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI

/// A view that configures and displays a variety of data streams
struct DashboardView: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var emitters: [any DashboardEmitter] = [
        TimeEmitter(),
        SingleIntEmitter(value: 32),
        OrderedStringEmitter(values: ["one", "two", "three", "four", "five"], interval: 1.5),
        SingleIntEmitter(value: 33),
        OrderedStringEmitter(values: ["uno", "dos", "tres"], interval: 3.2),
        SingleIntEmitter(value: 34)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(emitters, id: \.id) { emitter in
                    DashboardItemView(source: emitter)
                }
            }
            .padding()
            .fontDesign(.monospaced)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    DashboardView()
}
