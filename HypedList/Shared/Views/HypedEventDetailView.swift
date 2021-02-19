//
//  HypedEventDetailView.swift
//  HypedList
//
//  Created by Thomas Cowern New on 2/5/21.
//

import SwiftUI

struct HypedEventDetailView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @ObservedObject var hypedEvent: HypedEvent
    @State var showingCreateView = false
    @State var deleted = false
    var isDiscover = false
    
    var body: some View {
        
            if deleted {
                Text("Select an event")
            } else {
                if horizontalSizeClass == .compact {
                    compact
                } else {
                    regular
                }
            
        }
    }
    
    var compact: some View {
        VStack(spacing: 0) {
            if hypedEvent.image() != nil {
                hypedEvent.image()!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            Rectangle()
                .foregroundColor(hypedEvent.color)
                .frame(height: 15)
            
            HStack {
                Text(hypedEvent.title)
                    .font(.title)
                    .padding()
                
                Spacer()
            }
            .background(Color.white)

            Text("\(hypedEvent.timeFromNow().capitalized) on \(hypedEvent.dateAsString())")
                
            Spacer()
            
            if hypedEvent.validUrl() != nil {
                Button(action: {
                    if let url = hypedEvent.validUrl() {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HypedEventDetailVeiwButton(backgroundColor: Color.orange, imageName: "link", text: "Visit Site")
                }
            }
            
            if isDiscover {
                Button(action: {
                    DataController.shared.addFromDiscover(hypedEvent: hypedEvent)
                }) {
                    HypedEventDetailVeiwButton(backgroundColor: Color.blue, imageName: "plus.circle", text: hypedEvent.hasBeenAdded ? "Added" : "Add")
                }
                .disabled(hypedEvent.hasBeenAdded)
                .opacity(hypedEvent.hasBeenAdded ? 0.5 : 1.0)
                
            } else {
                Button(action: {
                    showingCreateView = true
                }) {
                    HypedEventDetailVeiwButton(backgroundColor: Color.yellow, imageName: "pencil.circle", text: "Edit Event")
                }
                .sheet(isPresented: $showingCreateView) {
                    CreateHypedEventView(hypedEvent: hypedEvent)
                }
                
                Button(action: {
                    DataController.shared.deleteHypedEvent(hypedEvent: hypedEvent)
                    deleted = true
                }) {
                    HypedEventDetailVeiwButton(backgroundColor: Color.red, imageName: "trash", text: "Delete Event")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var regular: some View {
        VStack {
            VStack(spacing: 0) {
                if hypedEvent.image() != nil {
                    hypedEvent.image()!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                   hypedEvent.color
                    .aspectRatio(contentMode: .fit)
                }
                

                    Text(hypedEvent.title)
                        .font(.largeTitle)

                    Text("\(hypedEvent.timeFromNow().capitalized) on \(hypedEvent.dateAsString())")
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        .font(.title)
                
                HStack {
                    if hypedEvent.validUrl() != nil {
                        Button(action: {
                            if let url = hypedEvent.validUrl() {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HypedEventDetailVeiwButtonCompact(backgroundColor: Color.orange, imageName: "link", text: "Visit Site")
                        }
                    }
                    
                    if isDiscover {
                        Button(action: {
                            DataController.shared.addFromDiscover(hypedEvent: hypedEvent)
                        }) {
                            HypedEventDetailVeiwButtonCompact(backgroundColor: Color.blue, imageName: "plus.circle", text: hypedEvent.hasBeenAdded ? "Added" : "Add")
                        }
                        .disabled(hypedEvent.hasBeenAdded)
                        .opacity(hypedEvent.hasBeenAdded ? 0.5 : 1.0)
                        
                    } else {
                        Button(action: {
                            showingCreateView = true
                        }) {
                            HypedEventDetailVeiwButtonCompact(backgroundColor: Color.yellow, imageName: "pencil.circle", text: "Edit Event")
                        }
                        .sheet(isPresented: $showingCreateView) {
                            CreateHypedEventView(hypedEvent: hypedEvent)
                        }
                        
                        Button(action: {
                            DataController.shared.deleteHypedEvent(hypedEvent: hypedEvent)
                            deleted = true
                        }) {
                            HypedEventDetailVeiwButtonCompact(backgroundColor: Color.red, imageName: "trash", text: "Delete Event")
                        }
                    }
                }
                .padding(10)
                
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding(40)
            
           
        }
    }
}

struct HypedEventDetailVeiwButton: View {
    
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
            HStack {
                Spacer()
                Image(systemName: imageName)
                Text(text)
                Spacer()
            }
            .font(.title2)
            .padding(12)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 10)
    }
}

struct HypedEventDetailVeiwButtonCompact: View {
    
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
            HStack {
                Image(systemName: imageName)
                Text(text)
            }
            .font(.title2)
            .padding(12)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(5)

    }
}

struct HypedEventDetail_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventDetailView(hypedEvent: testHypedEvent1)
        HypedEventDetailView(hypedEvent: testHypedEvent2)
        HypedEventDetailVeiwButton(backgroundColor: Color.orange, imageName: "link", text: "Visit Site")
        HypedEventDetailVeiwButtonCompact(backgroundColor: Color.blue, imageName: "link", text: "Visit Site")
    }
}
