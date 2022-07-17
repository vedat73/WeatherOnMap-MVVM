//
//  Constants.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 3.07.2022.
//

public let APIKey = "" // Set your API Key
public let ApiBaseURL = "https://api.openweathermap.org/data/2.5/"

let weatherStatesTest : [[WeatherStates]] = [
    [.Sun],
    [.Cloud],
    [.Cloud, .Raindrop],
    [.Cloud, .Raindrop],
    [.Cloud, .Lightning],
    [.Cloud, .Raindrop, .Lightning],
    [.Cloud, .Snow]
]
let weatherDescriptionTest : [String] = [
    "clear sky 24.3 C",
    "broken clouds 19.4 C",
    "light rain 15.7 C",
    "shower rain 14.2 C",
    "thunderstorm 16.4 C",
    "thunderstorm with rain 12.1 C",
    "snow 2.3 C"
]
