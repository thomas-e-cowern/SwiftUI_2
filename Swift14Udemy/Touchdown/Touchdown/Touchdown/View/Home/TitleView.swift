//
//  TitleView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/30/21.
//

import SwiftUI

struct TitleView: View {
    
    // MARK:  Properties
    var title : String
    
    // MARK:  Body
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            
        }// End of HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

// MARK:  Preview
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
