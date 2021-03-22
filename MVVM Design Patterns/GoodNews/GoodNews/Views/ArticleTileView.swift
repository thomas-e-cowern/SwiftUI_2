//
//  ArticleTileView.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/16/21.
//

import SwiftUI

struct ArticleTileView: View {
    
    var article : Article
    
    var body: some View {
        
        HStack {
            if article.image() != nil {
                article.image()?
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
            Text(article.title ?? "No title available")
                .padding()
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        }
        .border(Color.black, width: 3)
        .cornerRadius(5)
    }
}

struct ArticleTileView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleTileView(article: testArticle1)
    }
}
