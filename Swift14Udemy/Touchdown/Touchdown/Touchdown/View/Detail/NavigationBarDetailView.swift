//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }  // HStack
    }
}

// MARK:  Preview
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
