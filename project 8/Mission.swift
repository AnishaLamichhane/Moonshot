//
//  Mission.swift
//  project 8
//
//  Created by Anisha Lamichhane on 5/18/21.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return ""
        }
    }
    
    func crewNames(astronauts: [Astronaut], separator: Character = "\n") -> String {
        var crewNames = ""

        for member in crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                crewNames += match.name + String(separator)
            }
            else {
                fatalError("Crew member \(member.name) not found")
            }
        }

        return String(crewNames.dropLast())
    }
}
