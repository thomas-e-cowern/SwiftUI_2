//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct TopPartDetailView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        HStack (alignment: .center, spacing: 6, content: {
            // Price
            VStack (alignment: .leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)
                Text(sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            })  // Vstack
            // Photo
        })  // Hstack
    }
}

// MARK:  Preview
struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
