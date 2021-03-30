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
    
    // Color values
    var red : Double { return color[0] }
    var green : Double { return color[1] }
    var blue : Double { return color[2] }
    
    // Formatted price
    var formattedPrice : String { return "$\(price)" }
    
    
}
