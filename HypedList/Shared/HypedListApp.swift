//
//  HypedListApp.swift
//  Shared
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

@main
struct HypedListApp: App {
    var body: some Scene {
        WindowGroup {
            HypedListTabView()
                .onAppear {
                    DataController.shared.loadData()
                }
        }
    }
}
