//
//  Current.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 16/10/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import Foundation
import UIkit

struct current {
    var currentTime: String?
    var temperature: Int
    var humidity: Double
    var precipProbablity: Double
    var summery: String
    var icon: UIImage?
    
    init (weatherDictionary: NSDictionary){
        let currentWeather = weatherDictionary["currently"] as NSDictionary
        
        temperature = currentWeather ["temperature"] as Int
        humidity = currentWeather ["humidity"] as Double
        precipProbablity = currentWeather ["precipProbability"] as Double
        summery = currentWeather ["summary"] as String
        
        let currentTimeIntValue = currentWeather ["time"] as Int
        currentTime = dateStringFromUnixTime(currentTimeIntValue)
        
        let iconString = currentWeather ["icon"] as String
        icon = weatherIconFromString(iconString)
        
        //variabile per cambiare temperature da F a C
        
        let fahrenheit = currentWeather["temperature"]as Int
        temperature = convertToCelsius (fahrenheit)
    }
    
    // funzione che serve con formula per il cambiamento dell'apocanzi variabile
    
    func convertToCelsius (fahrenheit: Int) -> Int {
        return Int (5.0 / 9.0 * (Double(fahrenheit) - 32.0))
    }
    
    
    // date formatter style: guarda documentazione per i vari stili che si possono avere delle date...
    
    func dateStringFromUnixTime(unixTime: Int) -> String {
        let timeInSeconds = NSTimeInterval(unixTime)
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        return dateFormatter.stringFromDate(weatherDate)
    }
    
    
    func weatherIconFromString (stringIcon: String) -> UIImage {
        var imageName: String
        
        // si usa switch in questo caso se non trova l'icona nell'immage assets allora in quel caso va a pigliarsi nell'database del sito forecast.io una generica.
        
        switch stringIcon {
        case "clear-day":
            imageName = "clear-day"
        case "clear-night":
            imageName = "clear-night"
        case "rain":
            imageName = "rain"
        case "snow":
            imageName = "snow"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "wind"
        case "fog":
            imageName = "fog"
        case "cloudy":
            imageName = "cloudy"
        case "partly-cloudy-day":
            imageName = "partly-cloudy"
        case "partly-cloudy-night":
            imageName = "cloudy-night"
        default:
            imageName = "default"
        }
        
        // crea una istanza per far passare l'imnagine
        
        var iconImage = UIImage(named: imageName)
        return iconImage!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}