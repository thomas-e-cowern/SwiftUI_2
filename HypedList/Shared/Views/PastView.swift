//
//  PastView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/13/21.
//

import SwiftUI

struct PastView: View {
    
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.pastHypedEvents, noEventsText: "No events have occured in the past yet...")
        .navigationTitle("Past Events")
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}
