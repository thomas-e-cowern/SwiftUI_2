//
//  Helper.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/16/21.
//

import Foundation


enum TimerMode {
    case running
    case ended
}

func secondsToMinutesAndSeconds (seconds: Int) -> String {
    let minutes = ""
    let seconds = ""
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    
    return "\(minuteStamp) : \(secondStamp)"
}
