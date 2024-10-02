//
//  HomePage.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//


import SwiftUI

struct HomepageView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Shared Tasks")) {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(task: task, onComplete: {
                            viewModel.toggleTaskCompletion(task: task)
                        })
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                
                Section {
                    HStack {
                        TextField("New task", text: $newTaskTitle)
                        Button("Add") {
                            viewModel.addTask(title: newTaskTitle)
                            newTaskTitle = ""
                        }
                        .disabled(newTaskTitle.isEmpty)
                    }
                }
            }
            .navigationTitle("RoomEase")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct TaskRow: View {
    let task: Task
    let onComplete: () -> Void
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            if task.isCompleted {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onComplete)
    }
}


#Preview {
    HomepageView()
}
