//
//  TimerView.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/18/21.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timeRemaining = 60
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {

           VStack {
               Text("Time: \(timeRemaining)")
                   .font(.largeTitle)
                   .foregroundColor(.white)
                   .padding(.horizontal, 20)
                   .padding(.vertical, 5)
                   .background(
                       Capsule()
                           .fill(Color.black)
                           .opacity(0.75)
                   )

           }
           .onReceive(timer) { time in
            guard self.isActive else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
           .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
               self.isActive = false
           }
           .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
               self.isActive = true
           }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
