//
//  PlanetDetailVCViewController.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import UIKit
import SDWebImage

class PlanetDetailVC: UIViewController {

    @IBOutlet weak var imgPlanet: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOrbitPeriod: UILabel!
    @IBOutlet weak var lblGravity: UILabel!
    
    //MARK: -  Instance Variable
    var planetDetail: Planet!
    
    //MARK: -  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    //MARK: -  Custom Methods
    func setupUI() {
        
        imgPlanet.sd_imageIndicator = SDWebImageActivityIndicator.gray

        //Setup navigation bar
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: "Planets Detail", preferredLargeTitle: false)
        
        //Show Planet image
        if let path = planetDetail.image,  let planet_url = URL(string: path) {
            imgPlanet.sd_setImage(with: planet_url)
        }
        
        //Show Planet details
        lblName.text = "Name: \(planetDetail.name)"
        lblOrbitPeriod.text = "Orbital Period: \(planetDetail.orbitalPeriod)"
        lblGravity.text = "Gravity: \(planetDetail.gravity)"
    }
}
