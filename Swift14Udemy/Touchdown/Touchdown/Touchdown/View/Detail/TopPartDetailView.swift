//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct TopPartDetailView: View {
    
    // MARK:  Properties
    @State private var isAnimating: Bool = false
    
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
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            
            // Photo
            Image(sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
        })  // Hstack
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        })
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
