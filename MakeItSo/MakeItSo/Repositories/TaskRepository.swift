//
//  TaskRepository.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository : ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init () {
        loadData()
    }
    
    func loadData () {
        db.collection("tasks").addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Task.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
}
