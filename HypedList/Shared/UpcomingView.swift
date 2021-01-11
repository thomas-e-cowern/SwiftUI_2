//
//  UpcomingView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    var hypedEvents: [HypedEvent] = []
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text("You need to add some hyped events! 😎\nCreate an event or check out the discover tab!")
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
                        Circle().foregroundColor(hypedEvent.color)
                    }
                }
            }
        }
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
        
        Group {
            NavigationView {
                UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2])
            }
            
            NavigationView {
                UpcomingView(hypedEvents: [])
            }
        }
    }
}
