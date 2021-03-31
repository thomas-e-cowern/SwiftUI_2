//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        VStack (alignment: .leading, spacing: 5, content: {
            // Navbar
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            // Header
            HeaderDetailView()
                .padding(.horizontal)
            
            // Top detail
            
            // Bottom detail
            
            // Ratings and sizes
            
            // Description
            
            // Quantity and favorite
            
            // Add to cart
            
            Spacer()
        })  // Vstack
        .ignoresSafeArea(.all, edges: .all)
        .background(Color(
                        red: sampleProduct.red,
                        green: sampleProduct.green,
                        blue: sampleProduct.blue)
        ).ignoresSafeArea(.all, edges: .all)
    }
}

// MARK:  Preview
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
