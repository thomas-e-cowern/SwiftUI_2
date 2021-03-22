//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import SwiftUI

struct FeaturedTabView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            } // Foreach

        } // Tabview
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

// MARK:  Preview
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewDevice("iPhone 11")
            .background(Color.gray)
    }
}
