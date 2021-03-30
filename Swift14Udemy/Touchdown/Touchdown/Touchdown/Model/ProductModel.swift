//
//  ProductModel.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/30/21.
//

import Foundation

struct Product : Codable, Identifiable {
    
    let id : Int
    let name : String
    let image : String
    let price : Int
    let description : String
    let color : [Double]
    
}
