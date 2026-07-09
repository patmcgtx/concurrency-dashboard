//
//  DashboardItemView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI

struct DashboardItemView: View {
    
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
    DashboardItemView(source: SingleIntEmitter(value: 2322))
    DashboardItemView(source: OrderedStringEmitter(values: ["one", "two", "three"]))
    DashboardItemView(source: TimeEmitter())
}
