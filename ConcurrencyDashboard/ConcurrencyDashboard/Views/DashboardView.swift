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
        GridItem(.flexible(minimum: 120, maximum: .infinity)),
        GridItem(.flexible(minimum: 120, maximum: .infinity))
    ]
    
    @State private var emitters: [any DashboardEmitter] = [
        TimeEmitter(name: "Clock"),
        SingleIntEmitter(name: "Just 32", value: 32),
        OrderedStringEmitter(name: "Nums", values: ["one", "two", "three", "four", "five"], interval: 1.5),
        SingleIntEmitter(name: "Just 33", value: 33),
        OrderedStringEmitter(name: "Numeros", values: ["uno", "dos", "tres"], interval: 3.2),
        SingleIntEmitter(name: "Just 34", value: 34)
    ]
    
    var body: some View {
        HStack {
            Text("Concurrency Dashboard")
                .font(.title)
            Button(
                action: {
                    withAnimation {
                        emitters.shuffle()
                    }
                },
                label: {
                    Image(systemName: "shuffle.circle")

                })
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(emitters, id: \.id) { emitter in
                    DashboardItemView(emitter: emitter)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.primary, lineWidth: 1)
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    DashboardView()
}
