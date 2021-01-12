//
//  DataController.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/12/21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published  var hypedEvents: [HypedEvent] = []
}
