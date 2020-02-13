//
//  Model.swift
//  MVCDemo
//
//  Created by Adaps on 10/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
// MARK: - CricketTeams
struct CricketTeams: Codable {
    let afghanistan, australia, bangladesh, england: [Player]
    let india, newZealand, pakistan, southAfrica: [Player]
    let sriLanka, westIndies: [Player]

    enum CodingKeys: String, CodingKey {
        case afghanistan = "Afghanistan"
        case australia = "Australia"
        case bangladesh = "Bangladesh"
        case england = "England"
        case india = "India"
        case newZealand = "New Zealand"
        case pakistan = "Pakistan"
        case southAfrica = "South Africa"
        case sriLanka = "Sri Lanka"
        case westIndies = "West Indies"
    }
}

// MARK: - Afghanistan
struct Player: Codable {
    let name: String
    let captain: Bool?
}



struct TeamCellModel:Codable {
    let countryName:String
    var playersList:[Player]
}
