//
//  CitiesViewController.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class CitiesViewController: UIViewController {
    
    
    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    var cityArrayList:Array<CityModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cities"
        presentor?.startFetchingCities()
//        showProgressIndicator(view: self.view)
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
//        self.uiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}


extension CitiesViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        
        cell.wimageView.af_setImage(withURL: URL(string: cityArrayList[indexPath.row].icon)!)
        cell.nameLabel.text = cityArrayList[indexPath.row].title
        cell.imageView?.af_setImage(withURL: URL(string: cityArrayList[indexPath.row].icon)!)
        cell.decriptionLabel.text = "Temperature: " + cityArrayList[indexPath.row].temperature + "°F and " + cityArrayList[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presentor?.showDetailedWeatherControllerWith(navigationController: self.navigationController!, forCity: cityArrayList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CitiesViewController:PresenterToViewProtocol{
    func showCities(cityArray: Array<CityModel>) {
        self.cityArrayList = cityArray
        self.uiTableView.reloadData()
//        hideProgressIndicator(view: self.view)
    }

    func showError() {
        
//        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Cities", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

}


