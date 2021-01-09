//
//  RoundedButtonView.swift
//  SwiftUI Basics
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct RoundedButtonView: View {
    
    var color : Color
    var text : String = "Default Value"
    
    var body: some View {
        
        Button(action: {
            print(text)
        }) {
            Text(text)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(10)
        }
    }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButtonView(color: .red, text: "Replace me")
    }
}
