//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct BrandItemView: View {
    
    // MARK:  Properties
    let brand : Brand
    
    // MARK:  Body
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
        
    }
}

// MARK:  Preview
struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[1])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
