//
//  TimerView.swift
//  AudioRecorderPlayer
//
//  Created by Thomas Cowern New on 1/18/21.
//

import SwiftUI

struct TimerView: View {
    
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        Text("\(currentDate)")
                .onReceive(timer) { input in
                    self.currentDate = input
                }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
