//
//  ContentView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/10/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    var fruits : [Fruit] = fruitsData
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
