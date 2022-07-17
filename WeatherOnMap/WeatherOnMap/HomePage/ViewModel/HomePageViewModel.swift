//
//  HomePageViewModel.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 3.07.2022.
//
import Foundation
import MapKit

class HomePageViewModel : NSObject {
    var weatherStates : [WeatherStates]?
    
    private var weatherManager : WeatherAPIManager = {
        let weather = WeatherAPIManager(38.00242242074829, 32.507747965603635)
        return weather
    }()
    private var coordinate = CLLocationCoordinate2D(latitude: 38.00242242074829, longitude: 32.507747965603635)
    
    private var weatherInfo : WeatherInfo?
    
    
    var updateWeatherInfo: ((_ coordinate : CLLocationCoordinate2D?,_ placeName:String?,_ description:String?) -> Void)?
    
    func fetchWeatherInfo(latitude : Double, longitude : Double) {
        coordinate.latitude = latitude
        coordinate.longitude = longitude
        weatherManager.lon = longitude
        weatherManager.lat = latitude
        DispatchQueue(label: "fetchDataFromAPI").async {
            self.weatherManager.getWeatherJsonData { [weak self] jsonData in
                if let jsonData = jsonData {
                    self?.weatherInfo = jsonData
                    guard let weatherInfo = self?.weatherInfo else {
                        return
                    }
                    self?.weatherStates = self?.getWeatherStates(weatherID: weatherInfo.weather[0].id)
                    if let main = weatherInfo.main, let description = weatherInfo.weather[0].description {
                        
                        self?.updateWeatherInfo?(self?.coordinate,weatherInfo.name,description + " " + String(main.temp).dropLast() + " C")
                        
                    }
                    
                }
            }
            
        }
    }
    
    func getWeatherStates(weatherID : Int) -> [WeatherStates]? {
        switch weatherID {
            case 200...202 :
                return [.Cloud, .Raindrop, .Lightning]
            case 210...221 :
                return [.Cloud, .Lightning]
            case 230...232 :
                return [.Drizzle, .Lightning]
            case 300...302 :
                return [.Drizzle]
            case 310...321 :
                return [.Drizzle, .Raindrop]
            case 500...531 :
                return [.Cloud, .Raindrop]
            case 600...613 :
                return [.Cloud, .Snow]
            case 615...616 :
                return [.Cloud, .Raindrop, .Snow]
            case 620...622 :
                return [.Cloud, .Snow]
            case 701...781 :
                return [.Fog]
            case 800:
                return [.Sun]
            case 801...804:
                return [.Cloud]
            default:
                return [.Sun]
        }
    }
}
