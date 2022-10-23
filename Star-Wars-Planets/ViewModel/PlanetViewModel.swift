//
//  PlanetViewModel.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation

class PlanetViewModel {
    
    private var isLoad = false
    public var nextUrl: String?
    
    func loadPlanet(url: String?, completion: @escaping (Result<[Planet], APIErrors>)->Void) {
        
        if isLoad {return}
        
        isLoad = true
        
        if url == nil  {
            
            completion(.failure(.pageLimitExceed))
            print("page limit exceed")
            return
        }
        
        PlanetAPI.getPlanetList(url: url!) { [self] result in
            
            switch result {
                
            case .success(let response):
                
                isLoad = false
                nextUrl = response.next
                
                completion(.success(response.results))
                
            case .failure(let error):
            
                completion(.failure(error))
                print("Failed to load planet list \(error)")
            }
            
        }
    }
}
