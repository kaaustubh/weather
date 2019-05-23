//
//  CitiesInteractor.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import Alamofire

class CitiesInteractor: PresenterToInteractorProtocol
{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchCities()
    {
        let path = Bundle.main.path(forResource: "Cities", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
        let cityArr = NSMutableArray()
        var cities = NSArray()
        
        if let data = dict?.object(forKey: "Cities") as? [NSDictionary]
        {
            cities = data as NSArray
        }
    
        var count = 0
        for city in cities
        {
            if let cid = (city as! NSDictionary).object(forKey: "id") as? String
            {
                let citiesApi = NSString.init(format: API_WEATHER_BULK as NSString, cid)
                let url = URL(string: citiesApi as String)!
                let urlRequest = URLRequest(url: url)
                Alamofire.request(urlRequest).responseJSON { response in
                    
                    if(response.response?.statusCode == 200){
                        if let json = response.result.value as AnyObject? {
                            print(json)
                            let city = CityModel(jsonData: json as! NSDictionary)
                            cityArr.add(city)
                        }
                        count += 1
                        if count == 3
                        {
                            if cityArr.count == 0
                            {
                                print("error")
                            }
                            else
                            {
                                self.presenter?.citiesFetchedSuccess(cityModelArray: cityArr as! Array<CityModel>)
                            }
                        }
                    }else {
                        print("error")
                        count += 1
                        if count == 3
                        {
                            if cityArr.count == 0
                            {
                                print("error")
                            }
                            else
                            {
                                self.presenter?.citiesFetchedSuccess(cityModelArray: cityArr as! Array<CityModel>)
                            }
                        }
                    }
                }
            }
            
        }
    }
}
