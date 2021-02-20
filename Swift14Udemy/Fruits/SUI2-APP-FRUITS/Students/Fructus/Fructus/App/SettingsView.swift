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
                    // MARK:  Section 1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "FRUCTUS", labelImage: "info.circle"),
                        content: {
                            Divider().padding(.vertical, 4)
                            HStack (alignment: .center, spacing: 10) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9.0)
                                
                                Text("Most fruits are naturally low in fat, sodium and calories.  None have cholestoral.  Fruits arre sources of many essential nutrients that provide the raw materials for a healthy lifestyle")
                                    .font(.footnote)
                            }
                    })
                    
                    // MARK:  Section 2
                    
                    
                    // MARK:  Section 3
                    
                    GroupBox (label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        
                        
                        SettingsRowView(name: "Developer", content: "Thomas Cowern")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "Yahoo", linkDestination: "yahoo.com")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    })
                    
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
