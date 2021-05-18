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
    let lauchDate: String?
    let crew: [CrewRole]
    let description: String
}
