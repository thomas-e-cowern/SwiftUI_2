//
//  Task.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
  Task(title: "Implement UI", completed: true),
  Task(title: "Connect to Firebase", completed: false),
  Task(title: "????", completed: false),
  Task(title: "PROFIT!!!", completed: false)
]
#endif
