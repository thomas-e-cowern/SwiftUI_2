//
//  ArticleModel.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/13/21.
//

import Foundation
import SwiftUI

class Article : ObservableObject, Codable, Identifiable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
        case imageData
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try? values.decode(String.self, forKey: .author)
        title = try? values.decode(String.self, forKey: .title)
        description = try? values.decode(String.self, forKey: .description)
        url = try? values.decode(String.self, forKey: .url)
        urlToImage = try? values.decode(String.self, forKey: .urlToImage)
        publishedAt = try? values.decode(String.self, forKey: .publishedAt)
        content = try? values.decode(String.self, forKey: .content)
        imageData = try? values.decode(Data.self, forKey: .imageData)
    }
    
    init() {
        
    }
    
    func image() -> Image? {
        if let data = imageData {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return nil
    }
}

struct Articles : Decodable {
    
    var status : String
    var totalResults: Int
    var articles : [Article]
}

var testArticle1 : Article {
    let article = Article()
    
    if let image = UIImage(named: "Leila") {
            if let data = image.pngData() {
                article.imageData = data
            }
        }
    
    article.title = "Article one title"
    article.description = "Article one description"
    
    return article
}

var testArticle2 : Article {
    let article = Article()
    
    article.title = "Article two title"
    article.description = "Article two description"
    
    return article
}
