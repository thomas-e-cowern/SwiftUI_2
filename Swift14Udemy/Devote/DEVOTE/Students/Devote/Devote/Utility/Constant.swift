//
//  Constant.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/24/21.
//

import SwiftUI

// MARK:  Formatter
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// Mark: UI
var backgroundGradient : LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// Mark: UX
let feedback = UINotificationFeedbackGenerator()
