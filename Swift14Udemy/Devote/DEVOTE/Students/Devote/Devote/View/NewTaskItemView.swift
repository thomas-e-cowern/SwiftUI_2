//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Thomas Cowern New on 6/25/21.
//

import SwiftUI

struct NewTaskItemView: View {
    
    // MARK:  Properties
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task : String = ""
    
    private var isButtonDisabled : Bool {
        task.isEmpty
    }
    
    // MARK:  Function
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
        }
    }
    
    // MARK:  Body
    var body: some View {
            VStack {
                Spacer()
                VStack {
                    VStack(spacing: 16) {
                        TextField("New Task", text: $task)
                            .padding()
                            .background(
                                Color(UIColor.systemGray6)
                            )
                            .cornerRadius(10)
                        
                        Button(action: {
                            addItem()
                        }, label: {
                            Spacer()
                            Text("Save")
                            Spacer()
                        })
                        .disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.gray : Color.pink)
                        .cornerRadius(10)
                    } // MARK:  VStack
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(
                        Color.white
                    )
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
                    .frame(maxWidth: 640)
            }  // End of VStack
                .padding()
        }
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView()
            .previewDevice("iPhone SE (2nd generation)")
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
