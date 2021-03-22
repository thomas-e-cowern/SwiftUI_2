//
//  ArticleView.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/15/21.
//

import SwiftUI

struct ArticleListView: View {
    
   var articles : [Article] = []
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(articles) { article in
                    NavigationLink(
                        destination: ArticelDetailView(article: article)) {
                        ArticleTileView(article: article)
                    }
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleListView(articles: [testArticle1, testArticle2])
    }
}
