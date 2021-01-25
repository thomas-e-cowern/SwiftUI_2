//
//  ContentView.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        List(0..<5) { item in
            Image(systemName: "circle")
            Text("Implement the UI!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
