//
//  TaskCellViewModel.swift
//  MakeItSo
//
//  Created by Thomas Cowern New on 1/25/21.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task : Task
    
    @Published var taskRepository = TaskRepository()
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init (task : Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $task
            .compactMap { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $task
            .dropFirst()
            .debounce(for: 1.0, scheduler: RunLoop.main)
            .sink { task in
                self.taskRepository.updateTask(task: task)
            }
            .store(in: &cancellables)
    }
    
}
