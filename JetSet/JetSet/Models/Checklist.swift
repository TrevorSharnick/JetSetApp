//
//  Checklist.swift
//  JetSet
//
//  Created by Nathan Fuller on 12/6/23.
//

import Foundation

///  **Each aircraft profile is composed of multiple checklist sections containing ChecklistItems objects, and a title header corresponding to different procedures (pre-engine start, engine start, computer systems, etc). **
struct Checklist: Codable {
    var title: String
    var items: [ChecklistItem]
}
