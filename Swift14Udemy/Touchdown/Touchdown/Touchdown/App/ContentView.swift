//
//  ContentView.swift
//  Touchdown
//
//  Created by Thomas Cowern New on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    
    
    // MARK:  Body
    var body: some View {
        FooterView()
            .padding(.horizontal)
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
