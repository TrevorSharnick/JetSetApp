//  ChecklistView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/28/23.
//

import SwiftUI

struct ChecklistView: View {
    // Each of these properties hold the checklist items for each of the aircraft's numerous procedural checklists.
    @State private var preEngineTodos: [ChecklistItem] = []
    @State private var engineStartTodos: [ChecklistItem] = []
    @State private var computerSystemTodos: [ChecklistItem] = []
    
    // This constructor attempts to load JSON data from the ChecklistData.json file
    init() {
        // Checks if the file "ChecklistData.json" exists in the app and returns its url
        if let fileURL = Bundle.main.url(forResource: "ChecklistData", withExtension: "json") {
            do {
                // If it exists, load the file's contents as 'Data'
                let data = try Data(contentsOf: fileURL)
                // JSONDecoder attempts to decode the JSON data into an instance of the ChecklistData struct, for each of the checklist procedure todos
                let checklistData = try JSONDecoder().decode(Checklist.self, from: data)
                self._preEngineTodos = State(initialValue: [])
                self._engineStartTodos = State(initialValue: [])
                self._computerSystemTodos = State(initialValue: [])
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
                Text("Pre-Engine Start")
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
        ChecklistView()
    }
}

#Preview {
    NavigationStack {
        ChecklistView()
    }
}

