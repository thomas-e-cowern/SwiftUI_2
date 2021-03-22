//
//  ArticelDetailView.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/16/21.
//

import SwiftUI

struct ArticelDetailView: View {
    
    var article : Article
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            
            if article.image() != nil {
                article.image()?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Text(article.title ?? "No article title")
                .font(.headline)
                .fontWeight(.heavy)
                .padding()
            
            Text(article.author ?? "No author available")
                .padding()
            
            Text(article.description ?? "No article description")
                .font(.callout)
                .padding()
            
            if let url = article.url {
                Button(action: {
                   
                    if let url = URL(string: url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("See full article in browser")
                }
                .padding()
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .customNavbarColor(.gray)
    }
}

struct ArticelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticelDetailView(article: testArticle1)
    }
}
