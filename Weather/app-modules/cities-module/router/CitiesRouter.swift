//
//  CitiesRouter.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

class CitiesRouter: PresenterToRouterProtocol {
    func pushToDetailScreen(navigationConroller navigationController: UINavigationController, city: CityModel) {
        let detailsController = DetailRouter.createDetailModule(model: city)
        navigationController.pushViewController(detailsController, animated: true)
    }
    
    static func createModule() -> CitiesViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CitiesViewController") as! CitiesViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CitiesPresenter()
        let interactor: PresenterToInteractorProtocol = CitiesInteractor()
        let router:PresenterToRouterProtocol = CitiesRouter()
        
        view.presentor = presenter
        presenter.view = view as? PresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
