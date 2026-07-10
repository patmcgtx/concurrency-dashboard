//
//  ClockView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/9/26.
//
import SwiftUI

/// A view that configures and displays a variety of time instruments
struct ClockView: View {

    let title: String
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var emitters: [any DashboardEmitter] = [
        TimeEmitter(name: "Year", timeFormat: "yyyy"),
        TimeEmitter(name: "Quarter", timeFormat: "QQQ"),
        TimeEmitter(name: "Month", timeFormat: "MMM"),
        TimeEmitter(name: "Day", timeFormat: "dd"),
        TimeEmitter(name: "DoW", timeFormat: "E"),
        TimeEmitter(name: "Hour", timeFormat: "HH"),
        TimeEmitter(name: "Minutes", timeFormat: "mm"),
        TimeEmitter(name: "Seconds", timeFormat: "ss"),
        TimeEmitter(name: "Ms", timeFormat: "SSS", intervalSecs: 0.1),
        TimeEmitter(name: "Zone", timeFormat: "zzz"),
        TimeEmitter(name: "GMT", timeFormat: "Z"),
    ]
    
    var body: some View {
        HStack {
            Text(title)
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
    ClockView(title: "Clock preview")
}
