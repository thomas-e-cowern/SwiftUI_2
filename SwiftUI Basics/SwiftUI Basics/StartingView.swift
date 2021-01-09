//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct StartingView: View {
    
    @State var sliderValue: Double = 0.0
    @State var textValue: String = ""
    
    func canTap() -> Bool {
        return !(sliderValue > 0.5)
    }
    
    var body: some View {
            
        VStack {
            
            Slider(value: $sliderValue)
                .padding()
            
            Text("Slider is \(sliderValue)")
            
            TextField("Enter Your Stuff Here...", text: $textValue)
                .padding()
            
            Text("The text field value is \(textValue)")
            
            Button(action: {
                sliderValue = 0.0
            }) {
                Text("Reset")
            }
            
            RoundedButtonView(color: .orange)
                .disabled(canTap())
            RoundedButtonView(color: .blue, text: "Blue")
            RoundedButtonView(color: .purple, text: "Purple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
//        Group {
//            StartingView().previewDevice("iPhone 8")
//            StartingView().previewDevice("iPhone 11")
//            StartingView().previewDevice("iPad Pro (9.7-inch)")
//        }
    }
}
