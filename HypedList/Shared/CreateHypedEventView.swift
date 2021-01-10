//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/10/21.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        Form {
            Section {
                FormLabelView(title: "Title", iconSystemName: "keyboard", color: .blue)
                TextField("Family Vacation", text: $hypedEvent.title).autocapitalization(.words)
            }
            
            Section {
                FormLabelView(title: "Date & Time", iconSystemName: "calendar", color: .green)
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date]).datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime) {
                    FormLabelView(title: "Time", iconSystemName: "clock.fill", color: .blue)
                }
            }
            
            Section {
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Pick An Image")
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker()
                }
            }
            
            Section {
                ColorPicker(selection: $hypedEvent.color) {
                    FormLabelView(title: "Color", iconSystemName: "calendar", color: .yellow)
                }
            }
            
            Section {
                FormLabelView(title: "URL", iconSystemName: "curlybraces.square.fill", color: .purple)
                TextField("Website", text: $hypedEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
            
            
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
