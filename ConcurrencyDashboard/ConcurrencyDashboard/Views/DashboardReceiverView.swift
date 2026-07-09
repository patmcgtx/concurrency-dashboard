//
//  DashboardReceiverView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI

struct DashboardReceiverView: View {
    
    let source: DashboardEmitter
    
    @State private var displayValue = "<init>"
    
    var body: some View {
        Text(displayValue)
            .onReceive(source.publisher) { updated in
                displayValue = updated
            }
    }
}

#Preview {
    DashboardReceiverView(source: SingleIntEmitter(value: 2322))
    DashboardReceiverView(source: OrderedStringEmitter(values: ["one", "two", "three"]))
    DashboardReceiverView(source: TimeEmitter())
}
