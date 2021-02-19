//
//  EmailPasswordLoginApp.swift
//  EmailPasswordLogin
//
//  Created by Thomas Cowern New on 1/26/21.
//

import SwiftUI
import Firebase

@main
struct EmailPasswordLoginApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
