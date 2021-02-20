//
//  SettingsLabelName.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/20/21.
//

import SwiftUI

struct SettingsLabelView: View {
    
    // MARK:  Properties
    var labelText : String
    var labelImage : String
    
    
    // MARK:  Body
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK:  Preview
struct SettingsLabelName_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "FRUCTUs", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
