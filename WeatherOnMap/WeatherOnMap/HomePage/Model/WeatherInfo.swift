//
//  WeatherInfo.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 19.06.2022.
//

import Foundation

struct Coord : Codable {
    var lon : Double
    var lat : Double
}
struct Main : Codable {
    var temp : Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Int
    var humidity : Int
}
struct Weather: Codable {
    var id : Int
    var main : String?
    var description : String?
    var icon : String?
}
struct Wind : Codable {
    var speed : Double
    var deg : Int
}
struct WeatherInfo : Codable {
    var coord : Coord?
    var weather : [Weather]
    var main : Main?
    var id : Int
    var name : String?
    
}

