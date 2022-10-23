//
//  PlanetTVC.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import UIKit
import SDWebImage

class PlanetTVC: UITableViewCell {

    @IBOutlet weak var imgPlanet: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblClimate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgPlanet.layer.cornerRadius = 10
        imgPlanet.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }

    func setupCell(planet: Planet) {
        
        //Show Poster image
        if let path = planet.image,  let planet_url = URL(string: path) {
            imgPlanet.sd_setImage(with: planet_url)
        }
        
        lblName.text = "Name: \(planet.name)"
        lblClimate.text = "Climate: \(planet.climate)"
    }
 
}
