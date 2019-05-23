//
//  DetailRouter.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: RouterProtocol {
    
    static func createDetailModule(model: CityModel) -> DetailViewController {
        let view = DetailRouter.mainstoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let presenter: DetailPresenterProtocol = DetailPresenter()
        
        let router:RouterProtocol = DetailRouter()
    
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
}
