//
//  DetailPresenter.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenter: DetailPresenterProtocol {
    func showDetailsFor(city: CityModel) {
        view?.showDetailsFor(city: city)
    }
    
    var view: DetailViewProtocol?
    var router: PresenterToRouterProtocol?

}


