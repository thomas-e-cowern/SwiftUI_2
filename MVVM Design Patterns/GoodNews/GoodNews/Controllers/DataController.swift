//
//  DataController.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation
import SwiftUI

class DataController : ObservableObject {
    
    static var shared = DataController()
    
    @Published var articles: [Article] = []
    
    func getArticles() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=91918a83b185469c9f81f5af74ae59f9") else { return }
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let articleData = data {
                print("JSON String: \(String(describing: String(data: articleData, encoding: .utf8)))")
                if let articleJson = try? JSONDecoder().decode(Articles.self, from: articleData) {
                    print("AL:", articleJson.articles[1].author as Any)
                    
                    var newArticles : [Article] = []
                    
                    for article in articleJson.articles {
                        print(article)
                        
                        let articleToAdd = Article()
                        
                        articleToAdd.title = article.title
                   
                        articleToAdd.description = article.description
                    
                        articleToAdd.author = article.author
                        
                        articleToAdd.content = article.content
                        
                        articleToAdd.url = article.url
                        
                        if let imageUrl = article.urlToImage {
                            if let url = URL(string: imageUrl) {
                                 if let data = try? Data(contentsOf: url) {
                                    articleToAdd.imageData = data
                                }
                            }
                        }
                        newArticles.append(articleToAdd)
                    }
                    DispatchQueue.main.async {
                        self.articles = newArticles
                    }
                    return
                }
            }
        }.resume()
    }
}


