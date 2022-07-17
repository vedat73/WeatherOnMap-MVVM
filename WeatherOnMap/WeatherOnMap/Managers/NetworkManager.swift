//
//  NetworkManager.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 3.07.2022.
//

import Foundation

class NetworkManager {
    var urlPath : String?
    init (urlPath:String?) {
        self.urlPath = urlPath
    }
    convenience init (){
        self.init(urlPath: nil)
    }
    func fetchData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let urlPath = urlPath else {
            return
        }
        let url = URL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {data, response, error in
            completionHandler(data,response,error)
        }
        task.resume()
                
    }
}
