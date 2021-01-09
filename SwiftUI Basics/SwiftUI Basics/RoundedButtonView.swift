//
//  RoundedButtonView.swift
//  SwiftUI Basics
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct RoundedButtonView: View {
    
    var color : Color
    
    var body: some View {
        Text("Tap Me!")
            .padding()
            .background(color)
            .foregroundColor(.white)
            .font(.largeTitle)
            .cornerRadius(10)
    }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButtonView(color: .red)
    }
}
