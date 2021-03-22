//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import SwiftUI

struct CategoryGridView: View {
    
    // MARK:  Properties
    
    // MARK:  Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section (
                        header: SectionView(rotateClockwise: false),
                        footer: SectionView(rotateClockwise: true)) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    } // For each
                } // Section
            }) // Lazygrid
            .frame(height: 140)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }) // Scrollview
    }
}

// MARK:  Preview
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
