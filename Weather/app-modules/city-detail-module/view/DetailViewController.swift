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
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detailed Weather"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = mycity?.title
        self.cloudLabel.text = String.init(format: "It will be %@%% cloudy today", (mycity?.cloud)!)
        self.windLabel.text = String.init(format: "The wind will be at %@mph today", (mycity?.wind)!)
    }
}



extension DetailViewController: DetailViewProtocol
{
    func showDetailsFor(city: CityModel) {
        self.mycity = city
    }
    
}

