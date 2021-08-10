//
//  BlankView.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/25/21.
//

import SwiftUI

struct BlankView: View {
    
    // MARK:  Property
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK:  Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor )
        .opacity(backgroundOpacity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            .background(BackgroundImageVIew())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
