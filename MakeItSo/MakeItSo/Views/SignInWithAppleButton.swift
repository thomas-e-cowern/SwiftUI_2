//
//  SignInWithAppleButton.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/26/21.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton : UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
