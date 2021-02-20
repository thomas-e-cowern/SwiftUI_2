//
//  SettingsView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/19/21.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK:  Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack (spacing: 20) {
                    
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }// end of vstack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                })
                .padding()
            }// end of scroll view
        }// end of navigation view
    }
}

// MARK:  Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
