//
//  HypedEvent.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/10/21.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject, Identifiable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
    func image() -> Image? {
        if let data = imageData {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return nil
    }
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    
    if let image = UIImage(named: "Leila") {
        if let data = image.pngData() {
            hypedEvent.imageData = data
        }
    }
    
    hypedEvent.title = "Architecture show"
    hypedEvent.color = .blue
    hypedEvent.date = Date()
    hypedEvent.url = "www.yahoo.com"
    
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    
//    if let image = UIImage(named: "Leila") {
//        if let data = image.pngData() {
//            hypedEvent.imageData = data
//        }
//    }
    
    hypedEvent.title = "Family gathering show"
    hypedEvent.color = .red
    hypedEvent.date = Date()
    hypedEvent.url = "www.google.com"
    
    return hypedEvent
}
