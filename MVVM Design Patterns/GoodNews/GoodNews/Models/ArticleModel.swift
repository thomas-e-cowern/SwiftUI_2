//
//  ArticleModel.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation

struct ArticleList : Decodable {
    let articles : [Article]
}

struct Article : Decodable {
    
    let title: String?
    let description: String?
    
}
