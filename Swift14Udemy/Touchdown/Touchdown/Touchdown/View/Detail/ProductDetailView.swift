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
            TopPartDetailView()
                .padding(.horizontal)
            
            // Bottom detail
            VStack (alignment: .center, spacing: 0, content: {
                // Ratings and sizes
                
                // Description
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                })  // Scroll view
                // Quantity and favorite
                
                // Add to cart
                
                Spacer()
            })  // VStack
            .padding(.horizontal)
            .background(Color.white)
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
