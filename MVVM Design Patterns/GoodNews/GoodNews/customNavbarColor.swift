//
//  customNavbarColor.swift
//  GoodNews
//
//  Created by Thomas Cowern New on 3/12/21.
//

import Foundation
import SwiftUI

extension View {
 
    func customNavbarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(CustomNavigationBar(backgroundColor: backgroundColor))
    }

}

