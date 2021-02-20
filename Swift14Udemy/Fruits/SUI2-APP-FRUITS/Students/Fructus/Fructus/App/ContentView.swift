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
    
    @State private var isShowingSettings : Bool = false
    
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
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }){
                Image(systemName: "slider.horizontal.3")
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
            )
        }// end of navigation veiw
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
