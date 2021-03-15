//
//  ContentView.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/12/21.
//

import SwiftUI

struct ContentView: View {
    
    let articles = DataController.shared.getNewsHeadlines()
    
    var body: some View {
        
        NavigationView {
            VStack {
               
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Text("a news item...")
                }
            
            }
            .navigationBarTitle("Good News")
            .customNavbarColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
