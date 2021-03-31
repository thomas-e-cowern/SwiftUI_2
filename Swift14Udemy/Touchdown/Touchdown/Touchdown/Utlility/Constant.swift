//
//  Constant.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import Foundation
import SwiftUI

// Color

let colorBackground : Color = Color("ColorBackground")
let colorGrey : Color = Color(UIColor.systemGray4)

// Data

let players : [Player] = Bundle.main.decode("player.json")
let categories : [Category] = Bundle.main.decode("category.json")
let products : [Product] = Bundle.main.decode("product.json")
let brands : [Brand] = Bundle.main.decode("brand.json")

let sampleProduct : Product = products[1]

// Layout

let columnSpacing : CGFloat = 10
let rowSpacing : CGFloat = 10
var gridLayout : [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
