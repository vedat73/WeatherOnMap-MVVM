//
//  WeatherAPIManager.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 19.06.2022.
//

import Foundation

struct WeatherAPIManager {
    
    var lat : Double
    var lon : Double

    var apiUrlString : String?
    private let networkManager : NetworkManager?
    
    init(_ lat : Double, _ lon : Double) {
        self.lat = lat
        self.lon = lon
        self.networkManager = NetworkManager()
    }
    
    mutating func getWeatherJsonData( completion : @escaping (WeatherInfo?)->(Void)){
        self.apiUrlString = ApiBaseURL + "weather?lat=" + String(lat) + "&lon=" + String(lon) + "&units=metric&appid=" + APIKey

        self.networkManager?.urlPath =  self.apiUrlString
        
        guard let networkManager = networkManager else {
            return
        }
        
        networkManager.fetchData { data, response, error in
            if let error = error {
                print("error during request :" + error.localizedDescription)
                return completion(nil)
            } else if let data = data {
                let jsonResult = JSONParser()
                completion(jsonResult.DecodeJSON(data: data, codableClass: WeatherInfo.self))
            }
        }
//        let url = URL(string: apiUrlString)
//        guard url != nil else {
//            return
//        }
//        let session = URLSession.shared
//        let task = session.dataTask(with: url!) {data, response, error in
//            if let error = error {
//                print("error during request :" + error.localizedDescription)
//                return completion(nil)
//            } else if let data = data {
//                let jsonResult = JSONParser()
//                completion(jsonResult.DecodeJSON(data: data, codableClass: WeatherInfo.self))
//            }
//        }
//        task.resume()
    
    }
}
