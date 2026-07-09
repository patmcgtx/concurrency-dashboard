//
//  MainView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/8/26.
//
import SwiftUI

struct GridView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let emitters: [any DashboardEmitter] = [
        SingleIntEmitter(value: 32),
        SingleIntEmitter(value: 33),
        SingleIntEmitter(value: 34),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(emitters, id: \.id) { emitter in
                    DashboardReceiverView(source: emitter)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridView()
}
