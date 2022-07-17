//
//  WeatherStateFrame.swift
//  WeatherOnMap
//
//  Created by Vedat Ozlu on 25.06.2022.
//

import MapKit

class WeatherAnnotationView : MKAnnotationView {
    
    let weatherForecastView : WeatherForecastView = {
        let forecast = WeatherForecastView(frame: .zero)
        return forecast
    }()
    let pinImg : UIImageView = {
        let img = UIImageView()
        img.frame.size.height = 40
        img.frame.size.width = 30
        img.image = UIImage(named: "WeatherIcons/pin")
        img.clipsToBounds = true
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    let label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    init(annotation: MKAnnotation?, reuseIdentifier: String?,states : [WeatherStates],description : String?){
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        centerOffset = CGPoint(x: 0, y: -frame.size.height/2)
        
        canShowCallout = true
        setupUI()
        if let description = description {
            label.text = description
        }
        setWeatherCondition(states: states)
    }
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
      //  backgroundColor = .systemBlue
        weatherForecastView.frame = frame
        pinImg.frame.origin.y = frame.maxY - pinImg.frame.size.height + 10
        pinImg.frame.origin.x = frame.midX - pinImg.frame.size.width/2 
//        label.frame.size.width = frame.size.width
//        label.frame.size.height = 60
//        label.center.x = center.x
//        label.frame.origin.y = 0
        
        addSubview(weatherForecastView)
        addSubview(pinImg)
        addSubview(label)
        label.topAnchor.constraint(equalTo: self.topAnchor,constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func setWeatherCondition(states : [WeatherStates]){
        for state in states {
            switch state {
                case .Cloud:
                    weatherForecastView.addCloud()
                case .Lightning:
                    weatherForecastView.addLightning()
                case .Raindrop:
                    weatherForecastView.addRainDrop()
                case .Sun:
                    weatherForecastView.addSun(with: true)
                case .Snow:
                    weatherForecastView.addSnow()
                case .Fog:
                    weatherForecastView.addFog()
                case .Drizzle:
                    weatherForecastView.addDrizzle()
            }
        }
        weatherForecastView.startAnimation()
    }
}


