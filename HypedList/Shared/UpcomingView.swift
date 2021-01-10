//
//  UpcomingView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/9/21.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        Text("Upcoming")
            .navigationTitle("Upcoming")
            .navigationBarItems(trailing:
                                    Button(action: {}) {
                                        Image(systemName: "calendar.badge.plus")
                                    }
            )
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
