//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
            
        VStack {
            RoundedButtonView(color: .orange)
            RoundedButtonView(color: .blue)
            RoundedButtonView(color: .purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
