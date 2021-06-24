//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/24/21.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard () {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
