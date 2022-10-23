//
//  PlanetAPI.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation
import Alamofire

struct PlanetAPI {
    
    static func getPlanetList(url: String, completed: @escaping(Result<PlanetList, APIErrors>)-> Void) {
        
      
        let request = BaseService.shared.generateRequest(url: url, method: .get, body: nil)
        
        AF.request(request).validate().responseDecodable(of: PlanetList.self, decoder: BaseService.shared.decoder) { (response) in
            
            switch response.result {
                
            case .success(let result):
                
                completed(.success(result))
                
            case .failure(let error):
                
                print("Error from getPlanetList: - \(error)")
                
                if error.isResponseSerializationError {
                    
                    completed(.failure(.invalidResponse))
                    
                } else {
                    completed(.failure(.unableToComplete))
                }
            }
        }
    }
    
    
}
