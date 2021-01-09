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
            RoundedButtonView(color: .blue, text: "Blue")
            RoundedButtonView(color: .purple, text: "Purple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartingView().previewDevice("iPhone 8")
            StartingView().previewDevice("iPhone 11")
//            StartingView().previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
