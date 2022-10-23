//
//  PlanetVC.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import UIKit

class PlanetVC: UIViewController {
    
    //MARK: Instance Variable
    let viewModel = PlanetViewModel()
    var planetList: [Planet] = [Planet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: "Planets", preferredLargeTitle: true)
        
        

    }
    
    
    //MARK: Custom methods
    func setupUI() {
        
        viewModel.loadPlanet(url: Constant.PLANET_LIST_API) { [self] result in
            
            switch result {
                
            case .success(let list):
                
                list.forEach { planet in
                    
                    var planetDetail = planet
                    planetDetail.image = Helper.getRandomImage()
                    planetList.append(planetDetail)
                }
                
                
            case .failure(let error):
                
                print("error \(error)")
            }
            
        }
    }
   
}
