//
//  DataController.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation

class DataController : ObservableObject {
    
    static var shared = DataController()
    
    @Published var articles : [Article] = []
    
    func getArticles(url: URL, completion: @escaping ([Article]) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                
                print("Data:", data)
                
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    
                    print("AL:", articleList.articles as Any)
                } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError.localizedDescription)")
                }
                return
            }
            
        }.resume()
    
    }
    
    func getNewsHeadlines () {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=91918a83b185469c9f81f5af74ae59f9") else { return }
        
        let webService = WebService()
        
        webService.getArticles(url: url) {_ in
            
        }
    }
}


