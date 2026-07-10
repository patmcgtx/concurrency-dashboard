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
                DashboardView(title: "Dashboard")
            }
            Tab("Clock", systemImage: "circle") {
                ClockView(title: "Clock")
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
