//
//  DashboardItemView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI
import Combine

struct DashboardItemView: View {
    
    let source: DashboardEmitter
    
    @State private var displayValue = "--"
    
    var body: some View {
        VStack {
            Text(source.name)
                .font(.headline)
            Text(displayValue)
                .task {
                    for await value in source.publisher.values {
                        withAnimation {
                            displayValue = value
                        }
                    }
                }
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.primary, lineWidth: 1)
                )
        }
    }
}

#Preview {
    DashboardItemView(source: SingleIntEmitter(value: 2322))
    DashboardItemView(
        source: OrderedStringEmitter(
            values: ["one", "two", "three"],
            interval: 1.25
        )
    )
    DashboardItemView(source: TimeEmitter())
}
