//
//  SectionView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import SwiftUI

struct SectionView: View {
    
    // MARK:  Properties
    @State var rotateClockwise : Bool
    
    // MARK:  Body
    var body: some View {
        VStack (spacing: 0) {
            
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
        
            Spacer()
            
        } // VStack
        .background(colorGrey.cornerRadius(12))
        .frame(width: 85)
    }
}

// MARK:  Preview
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
