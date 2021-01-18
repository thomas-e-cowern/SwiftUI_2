//
//  UpcomingView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.upcomingHypedEvents, noEventsText: "You need to add some hyped events! 😎\nCreate an event or check out the discover tab!")
        .navigationTitle("Upcoming")
        .navigationBarItems(trailing:
                                Button(action: {
                                    showingCreateView = true
                                }) {
                                    Image(systemName: "calendar.badge.plus")
                                }
                                .sheet(isPresented: $showingCreateView) {
                                    CreateHypedEventView()
                                }
        )
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
