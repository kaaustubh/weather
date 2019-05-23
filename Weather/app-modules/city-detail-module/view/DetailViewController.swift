//
//  DetailViewController.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    var presenter: DetailPresenterProtocol?
    var mycity: CityModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail Weather"
    }
}

extension DetailViewController: DetailViewProtocol
{
    func showDetailsFor(city: CityModel) {
        
    }
    
}

