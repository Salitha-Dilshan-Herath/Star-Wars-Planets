//
//  Planet.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation

struct PlanetList: Codable {
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
    
}

struct Planet: Codable {
    
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    var image: String?
}
