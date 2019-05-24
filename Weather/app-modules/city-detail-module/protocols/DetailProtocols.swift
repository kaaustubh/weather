//
//  DetailProtocols.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol: class{
    var view: DetailViewProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func showDetailsFor(city: CityModel)
}

protocol DetailViewProtocol: class{
    func showDetailsFor(city: CityModel)
}

protocol RouterProtocol: class {
    static func createDetailModule(model: CityModel)->DetailViewController
}
protocol InteractorProtocol: class {
    
}

protocol InteractorToPresenterDetailsProtocol: class {
    
}
