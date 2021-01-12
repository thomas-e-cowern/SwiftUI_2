//
//  FormLabelView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/10/21.
//

import SwiftUI

struct FormLabelView: View {
    
    var title: String
    var iconSystemName: String
    var color: Color
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: iconSystemName)
                .padding(5)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(7)
        }
    }
}

struct FormLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(title: "", iconSystemName: "", color: .orange)
    }
}
