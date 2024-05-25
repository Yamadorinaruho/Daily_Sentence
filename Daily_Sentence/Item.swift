//
//  Item.swift
//  Daily_Sentence
//
//  Created by yamadorinaruho on 2024/05/26.
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
