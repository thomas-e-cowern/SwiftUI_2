//
//  SignInView.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/26/21.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var coordinator: SignInWithAppleCoordinator?
    
    var body: some View {
        VStack {
            Text("Thanks for using this app.  Sign in here....")
            SignInWithAppleButton()
                .frame(width: 280, height: 45, alignment: .center)
                .onTapGesture {
                    self.coordinator = SignInWithAppleCoordinator()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                            print("Successful Sign in")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
