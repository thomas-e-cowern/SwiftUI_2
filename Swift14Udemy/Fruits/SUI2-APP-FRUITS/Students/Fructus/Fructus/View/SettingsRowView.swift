//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/20/21.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK:  Properties
    var name : String
    var content : String? = nil
    var linkLabel : String? = nil
    var linkDestination : String? = nil
    
    // MARK:  Body
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(destination: URL(string: "http://\(linkDestination!)")!, label: {
                        Text(linkLabel!)
                    })
                    Image(systemName: "arrow.up.right.square").foregroundColor(Color.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK:  Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "John Conner")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(name: "Website", linkLabel: "This is a link", linkDestination: "yahoo.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
