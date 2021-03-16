//
//  ContentView.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var articles = [Article]()
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        
        NavigationView {
            VStack {
               
                ArticleListView(articles: data.articles)
                    .padding()
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
