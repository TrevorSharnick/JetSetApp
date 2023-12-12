//
//  Todos.swift
//  JetSet
//
//  Created by Trevor Sharnick on 12/4/23.
//

import Foundation

struct ChecklistItem: Identifiable, Codable {
    let id = UUID()
    let description: String
    let action: String
    var done: Bool
    
    enum CodingKeys: String, CodingKey {
        case description
        case action
        case done
    }
}
