//
//  Item.swift
//  ConcurrencyDashboard
//
//  Created by Patrick McGonigle on 7/7/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
