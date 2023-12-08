//
//  Checklist.swift
//  JetSet
//
//  Created by Nathan Fuller on 12/6/23.
//

import Foundation

/// A set of various lists of `Todo`s
struct Checklist: Codable {
    var preEngineTodos: [Todo]
    var engineStartTodos: [Todo]
    var computerSystemTodos: [Todo]
}
