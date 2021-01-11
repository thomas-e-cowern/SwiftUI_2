//
//  HypedEventTileView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/11/21.
//

import SwiftUI

struct HypedEventTileView: View {
    
    var hypedEvent: HypedEvent
    
    var body: some View {
        Text(hypedEvent.title)
    }
}

struct HypedEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventTileView(hypedEvent: testHypedEvent1)
    }
}
