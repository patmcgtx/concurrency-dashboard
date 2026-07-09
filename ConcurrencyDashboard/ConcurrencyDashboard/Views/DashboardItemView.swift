//
//  DashboardItemView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI
import Combine

struct DashboardItemView: View {
    
    let emitter: DashboardEmitter
    
    @State private var displayValue = "--"
    
    var body: some View {
        VStack {
            Text(emitter.name)
                .font(.headline)
            HStack {
                Text(displayValue)
                    .task {
                        for await value in emitter.publisher.values {
                            withAnimation {
                                displayValue = value
                            }
                        }
                    }
                    .fontDesign(.monospaced)
                    .fontWeight(.bold)
                    .padding()
                // TODO patmcg add a reset button
                Button("", systemImage: "arrow.clockwise") {}
            }
        }
    }
}

#Preview {
    DashboardItemView(
        emitter: SingleIntEmitter(
            name: "Just 2322",
            value: 2322
        )
    )
    DashboardItemView(
        emitter: OrderedStringEmitter(
            name: "Nums", values: ["one", "two", "three"],
            interval: 1.25
        )
    )
    DashboardItemView(emitter: TimeEmitter(name: "Time of Day"))
}
