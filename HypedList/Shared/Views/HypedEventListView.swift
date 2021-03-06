//
//  HypedEventListView.swift
//  HypedList (iOS)
//
//  Created by Thomas Cowern New on 1/13/21.
//

import SwiftUI

struct HypedEventListView: View {
    
    var hypedEvents: [HypedEvent] = []
    var noEventsText: String
    var isDiscover = false
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text(noEventsText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        NavigationLink(
                            destination: HypedEventDetailView(hypedEvent: hypedEvent, isDiscover: isDiscover)) {
                            HypedEventTileView(hypedEvent: hypedEvent)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct HypedEventListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypedEventListView(hypedEvents: [testHypedEvent1, testHypedEvent2], noEventsText: "You have no past events")
            
            HypedEventListView(hypedEvents: [], noEventsText: "You have no past events")
        }
    }
}
