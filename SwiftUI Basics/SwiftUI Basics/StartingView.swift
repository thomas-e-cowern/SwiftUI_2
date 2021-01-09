//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        Text("Tap Me!")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.largeTitle)
            .cornerRadius(10)
            
        
//        Button(action: {}) {
//            Text("Click here!")
//        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
