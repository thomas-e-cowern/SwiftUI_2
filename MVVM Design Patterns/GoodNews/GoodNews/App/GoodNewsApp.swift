//
//  GoodNewsApp.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/12/21.
//

import SwiftUI

@main
struct GoodNewsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    DataController.shared.getArticles()
                }
        }
    }
}
