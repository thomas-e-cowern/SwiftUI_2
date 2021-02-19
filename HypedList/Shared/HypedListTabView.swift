//
//  HypedListTabView.swift
//  Shared
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct HypedListTabView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            NavigationView {
                UpcomingView()
            }
                    .tabItem {
                        Image(systemName: "calendar.badge.plus")
                        Text("Upcoming")
                    }.tag(1)
            NavigationView {
                DiscoverView()
            }
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Discover") }.tag(2)
            NavigationView {
                PastView()
            }
                    .tabItem {
                        Image(systemName: "gobackward")
                        Text("Past") }.tag(3)
        }
    }
}

struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}
