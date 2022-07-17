//
//  ViewController.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 19.06.2022.
//

import UIKit
import MapKit
import CoreLocation

class HomePage: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    let mapView = MKMapView()

    let locationManager = CLLocationManager()
    var pin = MKPointAnnotation()
    var weatherdescription : String?
    let homePageViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.frame = view.bounds
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(mapLongPressed(gestureRecognizer: )))
        mapView.addGestureRecognizer(longTapGesture)
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        homePageViewModel.updateWeatherInfo = { [weak self] placeCoordinate,placeName,description in
            guard let placeCoordinate = placeCoordinate, let placeName = placeName, let description = description else {
                return
            }
            DispatchQueue.main.async {
                
                
                
                self?.weatherdescription = placeName + ", " + description
                
                self?.pin.coordinate = placeCoordinate
                self?.pin.title = placeName
                self?.pin.subtitle = description
                guard let pin = self?.pin else {
                    return
                }

                self?.mapView.removeAnnotation(pin)
                self?.mapView.addAnnotation(pin)
                
                
            }
        }
        
    }
    @objc func mapLongPressed(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != UIGestureRecognizer.State.ended {
            let touchedlocation = gestureRecognizer.location(in: mapView)
            let locationCoordinate = mapView.convert(touchedlocation, toCoordinateFrom: mapView)
           // print("mapLongPressed()")
            
            homePageViewModel.fetchWeatherInfo(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)

        }
        if gestureRecognizer.state != UIGestureRecognizer.State.began {
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //battery
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedWhenInUse){
            print("location permission allowed")
            
        } else if (status == CLAuthorizationStatus.denied) {
            print("location permission denied")
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      //  print("locationManager(didUpdateLocations)")
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
            
            homePageViewModel.fetchWeatherInfo(latitude: coordinate.latitude, longitude: coordinate.longitude)
           
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            
                if let weatherStates = homePageViewModel.weatherStates {
                    annotationView = WeatherAnnotationView(annotation: annotation, reuseIdentifier: "custom",states: weatherStates,description: self.weatherdescription)

                }
            
        } else {
           
            annotationView = nil
            if let weatherStates = homePageViewModel.weatherStates {
                annotationView = WeatherAnnotationView(annotation: annotation, reuseIdentifier: "custom",states: weatherStates,description: self.weatherdescription)
            }
            
        }
        
        return annotationView
    }

}
