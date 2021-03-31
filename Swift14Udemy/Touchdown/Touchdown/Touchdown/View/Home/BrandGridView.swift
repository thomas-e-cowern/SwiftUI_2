//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/31/21.
//

import SwiftUI

struct BrandGridView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section {
                    ForEach(brands) { brand in
                        BrandItemView(brand: brand)
                    }  // For each
                }  // Section
            })  // Lazy grid
            .frame(height: 200)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        })  // Sroll view
    }
}

// MARK:  Preview
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
