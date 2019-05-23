//
//  CitiesPresenter.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation

class CitiesPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingCities() {
        interactor?.fetchCities()
    }
}


extension CitiesPresenter: InteractorToPresenterProtocol{
    
    func citiesFetchedSuccess(cityModelArray: Array<CityModel>) {
        view?.showCities(cityArray: cityModelArray)
    }
    
    func citiesFetchFailed() {
        view?.showError()
    }
    
    
}
