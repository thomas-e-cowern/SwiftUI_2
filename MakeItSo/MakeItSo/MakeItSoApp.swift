//
//  MakeItSoApp.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import SwiftUI
import Firebase

@main
struct MakeItSoApp: App {
    
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
