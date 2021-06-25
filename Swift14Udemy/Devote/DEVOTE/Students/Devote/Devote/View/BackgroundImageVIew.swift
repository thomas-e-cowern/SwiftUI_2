//
//  BackgroundImageVIew.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/25/21.
//

import SwiftUI

struct BackgroundImageVIew: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageVIew()
    }
}
