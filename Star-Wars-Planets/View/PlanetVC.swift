//
//  PlanetVC.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import UIKit

class PlanetVC: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var tblPlanet: UITableView!
    
    //MARK: - Instance Variable
    let viewModel = PlanetViewModel()
    var planetList: [Planet] = [Planet]()
    var selectedPlanet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //pass data to the detail VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let planetDetailsVC = segue.destination as? PlanetDetailVC{
            
            planetDetailsVC.planetDetail = self.selectedPlanet
        }
        
    }
    
    
    //MARK: - Custom methods
    func setupUI() {
        
        //Setup navigation bar
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: "Planets", preferredLargeTitle: true)
    
        //Setup table
        tblPlanet.register(UINib(nibName: Constant.PLANET_CELL, bundle: nil), forCellReuseIdentifier: Constant.PLANET_CELL)
        tblPlanet.tableFooterView = UIView()

        getPlanets(url: Constant.PLANET_LIST_API)
    }
    
    func getPlanets(url: String?) {
        
        //Load Planet List
        viewModel.loadPlanet(url: url) { [self] result in
            
            switch result {
                
            case .success(let list):
                
                list.forEach { planet in
                    
                    var planetDetail = planet
                    planetDetail.image = Helper.getRandomImage()
                    planetList.append(planetDetail)
                }
                
                self.tblPlanet.reloadData()
                
            case .failure(let error):
                
                print("error \(error)")
            }
            
        }
    }
   
}
