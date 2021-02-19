//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/19/21.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK:  Properties
    var fruit : Fruit
    let nutrients : [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK:  Body
    var body: some View {
        GroupBox {
            DisclosureGroup ("Nutritional Value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }// end of group
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }// end of hstack
                }
            } // end of disclosure group
        } // end of groupbox
    }
}

// MARK:  Preview
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
