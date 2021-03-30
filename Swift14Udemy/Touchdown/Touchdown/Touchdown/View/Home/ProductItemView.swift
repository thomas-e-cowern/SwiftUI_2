//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/30/21.
//

import SwiftUI

struct ProductItemView: View {
    
    // MARK:  Properties
    let product : Product
    
    // MARK:  Body
    var body: some View {
        VStack (alignment: .leading, spacing: 6, content: {
            
            // Photo
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(Color(red: product.color[0], green: product.color[1], blue: product.color[2], opacity: 1.0))
            .cornerRadius(12)
            
            // Name
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // Price
            Text("$\(product.price)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
        })// End of VStack
    }
}

// MARK:  Preview
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[1])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
