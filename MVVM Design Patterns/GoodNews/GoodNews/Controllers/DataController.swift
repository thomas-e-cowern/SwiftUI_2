//
//  DataController.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation

class DataController {
    
    static var shared = DataController()
    
    func getNewsHeadlines () {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=91918a83b185469c9f81f5af74ae59f9") else { return }
        
        let webService = WebService()
        
        webService.getArticles(url: url) { _ in
            
        }
    }
}


