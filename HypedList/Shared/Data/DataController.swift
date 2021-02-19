//
//  DataController.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/12/21.
//

import Foundation
import SwiftDate
import UIColor_Hex_Swift
import SwiftUI
import WidgetKit

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published  var hypedEvents: [HypedEvent] = []
    @Published  var discoverHypedEvents: [HypedEvent] = []
    
    var upcomingHypedEvents: [HypedEvent] {
        return hypedEvents.filter { $0.date > Date().dateAt(.startOfDay) }.sorted { $0.date < $1.date }
    }
    
    var pastHypedEvents: [HypedEvent] {
        return hypedEvents.filter { $0.date < Date().dateAt(.startOfDay) }.sorted { $0.date < $1.date }
    }
    
    func saveData () {
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.MobileSoftwareServices.HypedList") {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(self.hypedEvents) {
                    defaults.setValue(encoded, forKey: "hypedEvents")
                    defaults.synchronize()
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        }
    }
    
    func loadData () {
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.MobileSoftwareServices.HypedList") {
                if let data = defaults.data(forKey: "hypedEvents") {
                    let decoder = JSONDecoder()
                    if let jsonHypedEvents = try? decoder.decode([HypedEvent].self, from: data) {
                        DispatchQueue.main.async {
                            self.hypedEvents = jsonHypedEvents
                        }
                    }
                }
            }
        }
    }
    
    func getUpcomingForWidget () -> [HypedEvent] {
        if let defaults = UserDefaults(suiteName: "group.MobileSoftwareServices.HypedList") {
            if let data = defaults.data(forKey: "hypedEvents") {
                let decoder = JSONDecoder()
                if let jsonHypedEvents = try? decoder.decode([HypedEvent].self, from: data) {
                    return jsonHypedEvents
                }
            }
        }
        return []
    }
    
    func savedHypedEvent (hypedEvent: HypedEvent) {
        if let index = hypedEvents.firstIndex(where: {loopingHypedEvent -> Bool in
            return hypedEvent.id == loopingHypedEvent.id
        }) {
            hypedEvents[index] = hypedEvent
        } else {
            hypedEvents.append(hypedEvent)
        }
        saveData()
    }
    
    func addFromDiscover (hypedEvent: HypedEvent) {
        hypedEvents.append(hypedEvent)
        hypedEvent.objectWillChange.send()
        saveData()
    }
    
    func deleteHypedEvent (hypedEvent: HypedEvent) {
        if let index = hypedEvents.firstIndex(where: {loopingHypedEvent -> Bool in
            return hypedEvent.id == loopingHypedEvent.id
        }) {
            hypedEvents.remove(at: index)
        }
        saveData()
    }
    
    func getDiscoverEvents () {
        
        if let url = URL(string: "https://api.jsonbin.io/b/60195182abdf9c556797258b/2") {
            var request = URLRequest(url: url)
            let key = "$2b$10$bCWBsENPuIA7l2jApOhG9OkDm1342smdICVJ8Pj9fN0IO4PCGXb.2"
            
            request.addValue(key, forHTTPHeaderField: "secret-key")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let webData = data {
                    if let json = try? JSONSerialization.jsonObject(with: webData, options: []) as? [[String : String]] {
                        
                        var hypedEventsToAdd: [HypedEvent] = []
                        
                        for jsonHypedEvent in json {
                            print(jsonHypedEvent)
                            let hypedEvent = HypedEvent()
                            if let id = jsonHypedEvent["id"] {
                                hypedEvent.id = id
                            }
                            
                            if let dateString = jsonHypedEvent["date"] {
                                SwiftDate.defaultRegion = Region.local
                                if let dateInRegion = dateString.toDate() {
                                    hypedEvent.date = dateInRegion.date
                                }
                                
                            }
                            
                            if let title = jsonHypedEvent["title"] {
                                hypedEvent.title = title
                            }
                            
                            if let url = jsonHypedEvent["url"] {
                                hypedEvent.url = url
                            }
                            
                            if let colorHex = jsonHypedEvent["color"] {
                                hypedEvent.color = Color(UIColor("#" + colorHex))
                            }
                            
                            if let imageUrl = jsonHypedEvent["imageUrl"] {
                                if let url = URL(string: imageUrl) {
                                     if let data = try? Data(contentsOf: url) {
                                        hypedEvent.imageData = data
                                    }
                                }
                            }
                            hypedEventsToAdd.append(hypedEvent)
                        }
                        DispatchQueue.main.async {
                            self.discoverHypedEvents = hypedEventsToAdd
                        }
                    }
                }
                
            }.resume()
        }
    }
    
}
