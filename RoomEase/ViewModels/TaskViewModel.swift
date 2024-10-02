//
//  TaskViewModel.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
