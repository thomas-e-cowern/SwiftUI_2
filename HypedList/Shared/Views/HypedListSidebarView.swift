//
//  HypedListSidebarView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 2/8/21.
//

import SwiftUI

struct HypedListSidebarView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UpcomingView()) {
                    Label("Upcoming", systemImage: "calendar")
                }
                NavigationLink(destination: DiscoverView()) {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                NavigationLink(destination: PastView()) {
                    Label("Past", systemImage: "gobackward")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Hyped List")
            .overlay(bottomSidebarView, alignment: .bottom)
            
            
            
            UpcomingView()
            
            Text("Select an event")
        }
    }
    
    var bottomSidebarView: some View {
        VStack {
            Divider()
            Button(action: {
                showingCreateView = true
            }) {
                Label("Create Event", systemImage: "calendar.badge.plus")
            }
            .sheet(isPresented: $showingCreateView) {
                CreateHypedEventView()
            }
            Divider()
        }
    }
}

struct HypedListSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListSidebarView()
    }
}
