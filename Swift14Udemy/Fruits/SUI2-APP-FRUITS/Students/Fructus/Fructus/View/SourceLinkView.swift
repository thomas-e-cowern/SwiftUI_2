//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Thomas Cowern New on 2/17/21.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Soutce")
                Spacer()
                Link("Wikipedia", destination: URL(string: "http://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
