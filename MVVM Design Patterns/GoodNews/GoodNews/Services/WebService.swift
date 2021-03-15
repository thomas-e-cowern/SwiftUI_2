//
//  WebService.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation

class WebService {
    
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
    
}
