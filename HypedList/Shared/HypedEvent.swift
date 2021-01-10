//
//  HypedEvent.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/10/21.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject {
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    var imageData: Data?
}
