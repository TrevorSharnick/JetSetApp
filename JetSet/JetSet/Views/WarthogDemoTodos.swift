//
//  WarthogDemoView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/28/23.
//

import SwiftUI

struct WarthogDemoTodos: View {
    // Each of these properties hold the checklist items for each of the aircraft's numerous procedural checklists.
    @State private var preEngineTodos: [Todo] = []
    @State private var engineStartTodos: [Todo] = []
    @State private var computerSystemTodos: [Todo] = []
    
    // This constructor attempts to load JSON data from the ChecklistData.json file
    init() {
        // Checks if the file "ChecklistData.json" exists in the app and returns its url
        if let fileURL = Bundle.main.url(forResource: "ChecklistData", withExtension: "json") {
            do {
                // If it exists, load the file's contents as 'Data'
                let data = try Data(contentsOf: fileURL)
                // JSONDecoder attempts to decode the JSON data into an instance of the ChecklistData struct, for each of the checklist procedure todos
                let checklistData = try JSONDecoder().decode(Checklist.self, from: data)
                    self._preEngineTodos = State(initialValue: checklistData.preEngineTodos)
                    self._engineStartTodos = State(initialValue: checklistData.engineStartTodos)
                    self._computerSystemTodos = State(initialValue: checklistData.computerSystemTodos)
            } catch {
                print("Error loading JSON data: \(error)")
            }
        }
    }
    
    var body: some View {
        // The entire view should be enclosed within a list to scroll collectively
        List {
            Section {
                // Pre-Engine Start Checklist section
                ForEach ($preEngineTodos) { $todo in
                    HStack {
                        Text(todo.description)
                            .strikethrough(todo.done)
                        Spacer()
                        
                        Text(todo.action)
                            .strikethrough(todo.done)
                        Image(systemName: todo.done ? "checkmark.square" : "square")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        todo.done.toggle()
                    }
                }
            } header: {
                Text("Engine Start")
            }
            
            Section {
                // Engine Start Checklist section
                ForEach($engineStartTodos) { $todo in
                    HStack {
                        Text(todo.description)
                            .strikethrough(todo.done)
                        Spacer()
                        Text(todo.action)
                            .strikethrough(todo.done)
                        Image(systemName: todo.done ? "checkmark.square" : "square")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        todo.done.toggle()
                    }
                }
            } header: {
                Text("Engine Start")
            }
            
            Section {
                // Computer Systems Checklist section
                ForEach($computerSystemTodos) { $todo in
                    HStack {
                        Text(todo.description)
                            .strikethrough(todo.done)
                        Spacer()
                        Text(todo.action)
                            .strikethrough(todo.done)
                        Image(systemName: todo.done ? "checkmark.square" : "square")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        todo.done.toggle()
                    }
                }
            } header: {
                Text("Computer Systems")
            }
        }
        .navigationTitle("A-10 Procedures")
    }
}

#Preview {
    NavigationStack {
        WarthogDemoTodos()
    }
}

