//
//  TaskListView.swift
//  ToDoList
//
//  Created by Thomas Cowern New on 1/23/21.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel() // (7)
    @State var presentAddNewItem = false
    
    var body: some View {
      NavigationView {
        VStack(alignment: .leading) {
          List {
            ForEach (taskListVM.taskCellViewModels) { taskCellVM in // (8)
              TaskCell(taskCellVM: taskCellVM) // (1)
            }
            .onDelete { indexSet in
              self.taskListVM.removeTasks(atOffsets: indexSet)
            }
            if presentAddNewItem { // (5)
              TaskCell(taskCellVM: TaskCellViewModel.newTask()) { result in // (2)
                if case .success(let task) = result {
                  self.taskListVM.addTask(task: task) // (3)
                }
                self.presentAddNewItem.toggle() // (4)
              }
            }
          }
          Button(action: { self.presentAddNewItem.toggle() }) { // (6)
            HStack {
              Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
              Text("New Task")
            }
          }
          .padding()
          .accentColor(Color(UIColor.systemRed))
        }
        .navigationBarTitle("Tasks")
      }
    }
}

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView()
  }
}

struct TaskCell: View { // (5)
    @ObservedObject var taskCellVM: TaskCellViewModel // (1)
    var onCommit: (Result<Task, InputError>) -> Void = { _ in } // (5)
    
    var body: some View {
      HStack {
        Image(systemName: taskCellVM.completionStateIconName) // (2)
          .resizable()
          .frame(width: 20, height: 20)
          .onTapGesture {
            self.taskCellVM.task.completed.toggle()
          }
        TextField("Enter task title", text: $taskCellVM.task.title, // (3)
                  onCommit: { //(4)
                    if !self.taskCellVM.task.title.isEmpty {
                      self.onCommit(.success(self.taskCellVM.task))
                    }
                    else {
                      self.onCommit(.failure(.empty))
                    }
        }).id(taskCellVM.id)
      }
    }
}

enum InputError: Error {
  case empty
}
