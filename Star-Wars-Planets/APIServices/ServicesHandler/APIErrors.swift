//
//  APIErrors.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation

enum APIErrors: String, Error {
    
    case invalidResponse  = "Invalid response from server. Please try again."
    case unableToComplete = "Unable to complete your request. Something went wrong."
    case pageLimitExceed = "No more data available"

}
