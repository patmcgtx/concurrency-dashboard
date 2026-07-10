//
//  MainView.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/9/26.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Dashboard", systemImage: "circle") {
                DashboardView()
            }
            Tab("Clock", systemImage: "circle") {
                Text("TODO")
            }
            Tab("Music", systemImage: "circle") {
                Text("TODO")
            }
        }
    }
}

#Preview {
    MainView()
}
