//
//  Task.swift
//  ToDoList
//
//  Created by Thomas Cowern New on 1/23/21.
//

import Foundation

struct Task : Identifiable, Codable {
    var id : String = UUID().uuidString
    var title : String
    var priority : String
    var completed : Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case priority
        case completed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(title, forKey:CodingKeys.title)
        try container.encode(priority, forKey: CodingKeys.priority)
        try container.encode(completed, forKey: CodingKeys.completed)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        priority = try values.decode(String.self, forKey: .priority)
        completed = try values.decode(Bool.self, forKey: .completed)
    }
}

