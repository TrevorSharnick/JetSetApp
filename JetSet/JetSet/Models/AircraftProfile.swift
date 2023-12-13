//
//  AircraftProfile.swift
//  JetSet
//
//  Created by Trevor Sharnick on 12/10/23.
//

import Foundation

/// AircraftProfile is the model which represents the information displayed on each profile card. It also contains the aircraft's checklist information available when pressing on the corresponding profile card
struct AircraftProfile: Codable, Identifiable {
    let id = UUID()
    var title: String
    var image: String?
    var checklists: [Checklist]
    
    var imageURL: URL? {
        guard let image else {
            return nil
        }
        return URL(string: image)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case checklists
    }
}

/// Decodable container of list of profiles
extension AircraftProfile {
    struct Container: Decodable {
        var aircraftProfiles: [AircraftProfile]
    }
}
