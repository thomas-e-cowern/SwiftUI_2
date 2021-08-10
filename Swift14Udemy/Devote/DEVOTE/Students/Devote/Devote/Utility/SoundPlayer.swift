//
//  SoundPlayer.swift
//  Devote
//
//  Created by Thomas Cowern New on 8/10/21.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound (sound: String, type: String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("🤬🤬🤬🤬 Could not find or play the sound file...")
        }
    }
    
}
