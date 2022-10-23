//
//  Helper.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation

class Helper {
    
    static func getRandomImage() -> String {
        
        return "https://picsum.photos/seed/\(Int.random(in: 1...1000))/400/400"
    }
}
