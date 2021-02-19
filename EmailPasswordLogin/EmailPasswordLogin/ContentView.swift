//
//  ContentView.swift
//  EmailPasswordLogin
//
//  Created by Thomas Cowern New on 1/26/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var message = ""
    
    @State var email = ""
    @State var password = ""
    @State var shown = false
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Verify your account")
                .foregroundColor(.white)
            Text("Please enter your email and password")
                .foregroundColor(.white)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            TextField("Password", text: $password)
                .padding()
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            VStack {
                Button(action: {
                    Auth.auth().signIn(withEmail: self.email, password: self.password) { (response, error) in
                        if error != nil {
                            print("There was an error loggint in: \(error?.localizedDescription ?? "Default login error")")
                            message = "error: \(String(describing: error?.localizedDescription))"
                            self.shown.toggle()
                            return
                        }
                        message = "Successful Login"
                        self.shown.toggle()
                        
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                }
                
                Spacer()
                    .frame(height: 45)
                
                Button(action: {
                    Auth.auth().createUser(withEmail: self.email, password: self.password) { (response, error) in
                        if error != nil {
                            print("There was an error loggint in: \(error?.localizedDescription ?? "Default registration error")")
                            message = "\(String(describing: error?.localizedDescription))"
                            self.shown.toggle()
                            return
                        }
                        message = "Successful Registration"
                        self.shown.toggle()
                        
                    }
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                }
            }.alert(isPresented:$shown) {
                return Alert(title: Text(self.message))
            }
        }
        .padding()
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
