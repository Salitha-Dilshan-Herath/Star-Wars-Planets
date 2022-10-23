//
//  PlanetVCTableConfig.swift
//  Star-Wars-Planets
//
//  Created by Spemai-Macbook on 2022-10-23.
//

import Foundation
import UIKit

//MARK: - Table view setup
extension PlanetVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.planetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.PLANET_CELL, for: indexPath) as! PlanetTVC
        
        cell.setupCell(planet: self.planetList[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row + 1 == self.planetList.count {
            self.getPlanets(url: viewModel.nextUrl)
        }
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let data = self.movieList[indexPath.row]
//        self.selectedMovie = data
//
//        self.performSegue(withIdentifier: Constant.MOVIE_DETAIL_SEGUE, sender: nil)
//    }
}
