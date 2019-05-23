//
//  CitiesProtocol.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingCities()
//    func showCitiesController(navigationController:UINavigationController)
}


protocol PresenterToViewProtocol: class{
    func showCities(cityArray:Array<CityModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> CitiesViewController
    func pushToDetailScreen(navigationConroller navigationController:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}

    func fetchCities()
}

protocol InteractorToPresenterProtocol: class {
    func citiesFetchedSuccess(cityModelArray:Array<CityModel>)
    func citiesFetchFailed()
}
