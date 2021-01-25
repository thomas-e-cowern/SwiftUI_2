//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Thomas Cowern New on 1/23/21.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { TestDataTaskRepository() as TaskRepository }.scope(.application)
  }
}

