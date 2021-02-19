//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/15/21.
//

import SwiftUI

struct FruitDetailView: View {
    
    // MARK:  Properties
    var fruit : Fruit
    
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .center, spacing: 20) {
                    // Header
                    FruitHeaderView(fruit: fruit)
                    
                    
                    VStack (alignment: .leading, spacing: 20) {
                        // Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // Headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // Nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        // Sub heading
                        Text("Learn more about a \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // Description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        // Link
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    }// End of Vstack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }// End of Vstack
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }// End of scroll view
            .edgesIgnoringSafeArea(.top)
        }// End of navigation
    }
}

// MARK:  Preview
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
