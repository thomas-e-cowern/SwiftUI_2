//
//  TaskListViewModel.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published var taskRepository = TaskRepository()
    
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
      
      init() {
        taskRepository.$tasks.map { tasks in
          tasks.map { task in
            TaskCellViewModel(task: task)
          }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
      }
      
      func removeTasks(atOffsets indexSet: IndexSet) {
        // remove from repo
        let viewModels = indexSet.lazy.map { self.taskCellViewModels[$0] }
        viewModels.forEach { taskCellViewModel in
//          taskRepository.removeTask(taskCellViewModel.task)
        }
      }
      
      func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
//        taskRepository.addTask(task)
      }
}
