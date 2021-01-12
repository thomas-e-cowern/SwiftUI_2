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
        ScrollView {
            VStack {
                if data.hypedEvents.count == 0 {
                    Text("You need to add some hyped events! 😎\nCreate an event or check out the discover tab!")
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ForEach(data.hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
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
//            NavigationView {
//                UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2, testHypedEvent1, testHypedEvent2])
//            }
//            
//            NavigationView {
//                UpcomingView(hypedEvents: [])
//            }
        }
    }
}
