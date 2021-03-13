//
//  WebService.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]) -> ()) {
        print("Inside web service")
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("inside URLSession")
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                print(data)
            }
            
        }.resume()
    
    }
    
}
