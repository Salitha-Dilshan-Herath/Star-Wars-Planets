//
//  BaseService.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation
import Alamofire

class BaseService {
    
    public static let shared = BaseService()
    public let decoder = JSONDecoder()
    
    private let formatter = DateFormatter()
    
    private var request = URLRequest(url: URL(string: "https://swapi.dev/api")!)
    
    private init() {
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func generateRequest(url: String, method: HTTPMethod, body: Data?) -> URLRequest {
        
        guard let formateUrl = URL(string: url) else {
            fatalError("Invalid URL \(url)")
        }
        
        request.url      = formateUrl
        request.method   = method
        
        if let body_data = body {
            request.httpBody = body_data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
            
        return request
    }
}
