//
//  ContentView.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/14/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK:  Properties
    @State var task : String = ""
    

    
    // MARK:  Fetching data
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    // Mark: Functions
   

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // Mark: Body
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(items) { item in
                        VStack (alignment: .leading) {
                            Text(item.task ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        } // MARK:  VStack
                    }
                    .onDelete(perform: deleteItems)
                } // List
                .listStyle(InsetGroupedListStyle())
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                .padding(.vertical, 0)
                .frame(maxWidth: 640)
            } // MARK:  ZStack
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                #endif
            }   // Toolbar
            .background(
                BackgroundImageVIew()
            )
            .background(backgroundGradient.ignoresSafeArea(.all))
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
