//
//  WarthogDemoView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/28/23.
//

import SwiftUI

// Conforms to the 'Codable' protocol, which indicates that it can be encoded to/decoded from JSON data
struct ChecklistData: Codable {
    // Each of the ChecklistData properties are an array of 'Todo' objects
    var preEngineTodos: [Todo]
    var engineStartTodos: [Todo]
    var computerSystemTodos: [Todo]
}

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
                let checklistData = try JSONDecoder().decode(ChecklistData.self, from: data)
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
            // Title Section
            Section(header: Text("A-10 Procedures")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .listRowInsets(EdgeInsets())
            ) { }
        
            Section {
                // Pre-Engine Start Checklist section
                Text("Pre-Engine Start")
                    .font(.headline)
                    .foregroundColor(.blue)
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
            }
            Section {
                // Engine Start Checklist section
                Text("Engine Start")
                    .font(.headline)
                    .foregroundColor(.blue)
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
            }
            Section {
                // Computer Systems Checklist section
                Text("Computer Systems")
                    .font(.headline)
                    .foregroundColor(.blue)
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
            }
            
            
        }
        
    }
}

#Preview {
    WarthogDemoTodos()
}

