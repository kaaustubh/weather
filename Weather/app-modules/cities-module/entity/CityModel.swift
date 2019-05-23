//
//  CityModel.swift
//  Weather
//
//  Created by Kaustubh on 23/05/19.
//  Copyright © 2019 KaustubhtestApp. All rights reserved.
//

import Foundation
import ObjectMapper


private let TITLE = "name"
private let TEMPERATURE = "temp"
private let ICON = "icon"
private let WIND = "wind"
private let SPEED = "speed"
private let CLOUDS = "clouds"
private let ALL = "all"
private let MAIN = "main"
private let ICONURL = "http://openweathermap.org/img/w/"
private let WEATHER = "weather"
private let DESC = "description"

class CityModel{
    
    internal var temperature:String = ""
    internal var title:String = ""
    internal var icon:String = ""
    internal var wind:String = ""
    internal var cloud:String = ""
    internal var description: String = ""
    init(jsonData: NSDictionary) {
        
        if let data = (jsonData[TITLE] as? String){
            self.title = data
            print(data)
        }
        
        if let mdata = (jsonData[MAIN] as? NSDictionary) {
            if let data = mdata.object(forKey: TEMPERATURE)
            {
                self.temperature = String(format: "%@", data as! CVarArg)
            }
        }
        
        if let wdata = ((jsonData[WEATHER] as! NSArray).firstObject){
            if let data = (wdata as! NSDictionary).object(forKey: ICON) as? NSString
            {
                self.icon = ICONURL + (data as String) + ".png"
            }
        }
        
        if let wdata = (jsonData[WIND] as? NSDictionary){
            if let data = wdata.object(forKey: SPEED)
            {
                self.wind = String(format: "%@", data as! CVarArg)
            }
        }
        
        if let cdata = (jsonData[CLOUDS] as? NSDictionary){
            if let data = cdata.object(forKey: ALL)
            {
                self.cloud = String(format: "%@", data as! CVarArg)
            }
        }
        
        if let wdata = ((jsonData[WEATHER] as! NSArray).firstObject){
            if let data = (wdata as! NSDictionary).object(forKey: DESC) as? NSString
            {
                self.description = data as String
            }
            
        }
        
    }
    
}
