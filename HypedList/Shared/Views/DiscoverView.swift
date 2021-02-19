//
//  DiscoverView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 2/2/21.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.discoverHypedEvents.sorted { $0.date < $1.date }, noEventsText: "Loading events for you to paruse...", isDiscover: true)
        .navigationTitle("Discover Events")
        .navigationBarItems(trailing:
                                Button(action: {
                                    data.getDiscoverEvents()
                                }) {
                                    Image(systemName: "arrow.clockwise")
                                }
        )
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
