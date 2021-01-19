//
//  AudioTimer.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/18/21.
//

import Foundation

class AudioTimer: ObservableObject {
    
    @Published var timerMode: TimerMode = .ended
    
    @Published var secondsLeft = 60
    
    @Published var timer = 60
//    var timer = Timer()
    
//    func setTimerLength (minutes: Int) {
//        let defaults = UserDefaults.standard
//        defaults.set(minutes, forKey: "timerLength")
//        secondsLeft = minutes
//    }
    
//    func start () {
//        print("Timer started")
//        timerMode = .running
//        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//        timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: false, block: { (timer) in
//            if self.secondsLeft == 0 {
//                timer.invalidate()
//                print("Out of time")
//            }
//            self.secondsLeft -= 1
//            print("Seconds left: \(self.secondsLeft)")
//        })
//
//    }
    
    func start () {
        print("Timer started")
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    }
    
    func stop () {
        timerMode = .ended
        print("Timer stopped at \(self.secondsLeft)")
    }
    
//    func reset () {
//        self.timerMode = .initial
//        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
//        timer.invalidate()
//    }
//
//    func pause () {
//        self.timerMode = .paused
//        timer.invalidate()
//    }
    
}
