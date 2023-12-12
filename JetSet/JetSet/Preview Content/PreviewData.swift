//
//  PreviewData.swift
//  JetSet
//
//  Created by Trevor Sharnick on 12/11/23.
//

import Foundation

extension AircraftProfile {
    static let preview = AircraftProfile(title: "A-10 Warthog",
                                         image: Bundle.main.url(forResource: "Warthog", withExtension: "jpg")!.absoluteString,
                                         checklists: [])
    
    static let noImage = AircraftProfile(title: "A-10 Warthog", image: nil, checklists: [])
}
