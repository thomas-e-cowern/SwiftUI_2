//
//  AudioRecorderPlayerApp.swift
//  Shared
//
//  Created by Thomas Cowern New on 1/16/21.
//

import SwiftUI

@main
struct AudioRecorderPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(audioRecorder: AudioRecorder())
        }
    }
}
