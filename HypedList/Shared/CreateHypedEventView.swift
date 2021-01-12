//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 1/10/21.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        NavigationView {
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
                    if hypedEvent.image() == nil {
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .orange)
                            Spacer()
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Pick An Image")
                            }
                            
                        }
                    } else {
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .orange)
                            Spacer()
                            Button(action: {
                                hypedEvent.imageData = nil
                            }) {
                                Text("Remove Image")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                        }
                        Button(action: {
                           showImagePicker = true
                        }) {
                            hypedEvent.image()!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(imageData: $hypedEvent.imageData)
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
            .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}) {
                Text("Cancel")
            }, trailing: Button(action: {
                DataController.shared.hypedEvents.append(hypedEvent)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })
            .navigationTitle("Create")
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
