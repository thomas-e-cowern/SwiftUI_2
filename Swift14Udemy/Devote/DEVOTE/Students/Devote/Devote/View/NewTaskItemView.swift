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
    
    @AppStorage("isDarkMode") private var isDarkMode : Bool = false
    
    @State private var task : String = ""
    
    @Binding var isShowing : Bool
    
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
            isShowing = false
        }
    }
    
    // MARK:  Body
    var body: some View {
            VStack {
                Spacer()
                VStack {
                    VStack(spacing: 16) {
                        TextField("New Task", text: $task)
                            .foregroundColor(.pink)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        Button(action: {
                            addItem()
                            playSound(sound: "sound-ding", type: "mp3")
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Spacer()
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                            Spacer()
                        })
                        .disabled(isButtonDisabled)
                        .onTapGesture {
                            if isButtonDisabled {
                                playSound(sound: "sound-tap", type: "mp3")
                            }
                        }
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.blue : Color.pink)
                        .cornerRadius(10)
                    } // MARK:  VStack
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(
                        isDarkMode ? Color(UIColor.secondarySystemBackground) :   Color.white
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
        NewTaskItemView(isShowing: .constant(true))
            .previewDevice("iPhone SE (2nd generation)")
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
