//
//  ThunderAnimation.swift
//  WeatherAnimationTest
//
//  Created by Vedat Ozlu on 26.06.2022.
//

import UIKit



class WeatherForecastView : UIView {
    
    let imageViewCloud1 : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/cloud-96")
        img.clipsToBounds = true
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    let imageViewCloud2 : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/cloud-96")
        img.clipsToBounds = true
        return img
    }()
    
    let lightningView1 : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 50, y: 150, width: 90, height: 80))
        img.image = UIImage(named: "WeatherIcons/lightning")
        img.clipsToBounds = true
        img.contentMode = UIView.ContentMode.scaleAspectFit
        
        return img
    }()
    let lightningView2 : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 150, y: 150, width: 90, height: 80))
        img.image = UIImage(named: "WeatherIcons/lightning")
        img.clipsToBounds = true
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    
    let rainDropView : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/rain-drop")
        
        // img.backgroundColor = .yellow
        return img
    }()
    let rainDropView2 : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/rain-drop")
        
        // img.backgroundColor = .yellow
        return img
    }()
    let rainDropView3 : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/rain-drop")
        
        // img.backgroundColor = .yellow
        return img
    }()
    let sunView : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 90, y: 100, width: 80, height: 80))
        img.image = UIImage(named: "WeatherIcons/sun")
       // img.backgroundColor = .green
        return img
    }()
    let snowView : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/snow-blue")
        // img.backgroundColor = .yellow
        return img
    }()
    let snowView2 : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/snow-blue")
        // img.backgroundColor = .yellow
        return img
    }()
    let drizzleView : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/drizzle")
        // img.backgroundColor = .yellow
        img.clipsToBounds = true
        return img
    }()
    
    let fogView : UIImageView = {
        let img = UIImageView(frame: .zero)
        img.image = UIImage(named: "WeatherIcons/fog")
        img.clipsToBounds = true
        // img.backgroundColor = .yellow
        return img
    }()
    private lazy var expandingAnimation: CABasicAnimation = {
        let expandingAnimation = CABasicAnimation(keyPath: "transform.scale")
        expandingAnimation.fromValue = 1
        expandingAnimation.toValue = 1.2
        return expandingAnimation
    }()
    private lazy var fadingAnimation: CABasicAnimation = {
        let fadingAnimation = CABasicAnimation(keyPath: "opacity")
        fadingAnimation.fromValue = 1
        fadingAnimation.toValue = 0
        return fadingAnimation
    }()
    private lazy var animationGroup: CAAnimationGroup = {
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [expandingAnimation,fadingAnimation]
        animationGroup.duration = 1.5
        animationGroup.repeatCount = .infinity
        return animationGroup
    }()
    
    let sunPulsingView : CAShapeLayer = {
        let circle = UIBezierPath(arcCenter: CGPoint.zero, radius: 37, startAngle: -1*(CGFloat.pi/2), endAngle: CGFloat((-1*Int((CGFloat.pi/2)) + Int(2*CFloat.pi))), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circle.cgPath
        // Change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        // You can change the stroke color
        shapeLayer.strokeColor = UIColor.systemOrange.cgColor
        // You can change the line width
        shapeLayer.lineWidth = 9.0
        return shapeLayer
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
       // self.backgroundColor = .orange
        setViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func setViews() {
        let cloudPosXDiff :CGFloat = 20
        let centY :CGFloat = 100, centX :CGFloat = 100
//        imageViewCloud1 = UIImageView()
//        imageViewCloud2 = UIImageView()
        
        imageViewCloud1.frame.size.height = centY
        imageViewCloud1.frame.size.width = centX
        imageViewCloud1.frame.origin = CGPoint(x: centX - imageViewCloud1.frame.size.width/2 - cloudPosXDiff, y: centY - imageViewCloud1.frame.size.height/2)
        //imageViewCloud1.image = UIImage(named: "WeatherIcons/cloud-48")
        
        imageViewCloud2.frame.size.height = centY
        imageViewCloud2.frame.size.width = centX
        imageViewCloud2.frame.origin = CGPoint(x: centX - imageViewCloud2.frame.size.width/2 + cloudPosXDiff, y: centY - imageViewCloud2.frame.size.height/2)
        //imageViewCloud2.image = UIImage(named: "WeatherIcons/cloud-48")
        
        rainDropView.frame.size.height = 45
        rainDropView.frame.size.width = 15
        rainDropView.frame.origin = CGPoint(x: centX - 40, y: imageViewCloud1.frame.maxY)
        
        rainDropView2.frame.size.height = 45
        rainDropView2.frame.size.width = 15
        rainDropView2.frame.origin = CGPoint(x: centX, y: imageViewCloud1.frame.maxY)
        
        rainDropView3.frame.size.height = 45
        rainDropView3.frame.size.width = 15
        rainDropView3.frame.origin = CGPoint(x: centX + 40, y: imageViewCloud1.frame.maxY)
        
        lightningView1.frame.size.height = 45
        lightningView1.frame.size.width = 25
        lightningView1.frame.origin = CGPoint(x: centX - 25, y: imageViewCloud1.frame.maxY)
        
        lightningView2.frame.size.height = 45
        lightningView2.frame.size.width = 25
        lightningView2.frame.origin = CGPoint(x: centX + 25, y: imageViewCloud1.frame.maxY)
        
        snowView.frame.size.height = 20
        snowView.frame.size.width = 20
        snowView.frame.origin = CGPoint(x: centX - 25, y: imageViewCloud1.frame.maxY)
        
        snowView2.frame.size.height = 20
        snowView2.frame.size.width = 20
        snowView2.frame.origin = CGPoint(x: centX + 25, y: imageViewCloud1.frame.maxY)
        
        drizzleView.frame.size.height = centY
        drizzleView.frame.size.width = centX
        drizzleView.frame.origin = CGPoint(x: centX - drizzleView.frame.size.width/2, y: centY - drizzleView.frame.size.height/2)
        
        fogView.frame.size.height = centY
        fogView.frame.size.width = centX
        fogView.frame.origin = CGPoint(x: centX - fogView.frame.size.width/2, y: centY - fogView.frame.size.height/2)
        
        sunView.frame.size.height = 80
        sunView.frame.size.width = 80
        sunView.frame.origin = CGPoint(x: centX - sunView.frame.size.width/2, y: centY - sunView.frame.size.height/2)
    }
    func addLightning() {
       
        if !lightningView1.isDescendant(of: self) {
            self.addSubview(lightningView1)
            self.addSubview(lightningView2)
        }
    }
    func removeLightning() {
        if lightningView1.isDescendant(of: self) {
            lightningView1.layer.removeAllAnimations()
            lightningView2.layer.removeAllAnimations()
            lightningView1.removeFromSuperview()
            lightningView2.removeFromSuperview()
        }
    }
    func addRainDrop() {
        if !rainDropView.isDescendant(of: self) {
            self.addSubview(rainDropView)
            self.addSubview(rainDropView2)
            self.addSubview(rainDropView3)
            
        }
    }
    
    func removeRainDrop() {
        if rainDropView.isDescendant(of: self) {
            rainDropView.layer.removeAllAnimations()
            rainDropView2.layer.removeAllAnimations()
            rainDropView3.layer.removeAllAnimations()
            
            rainDropView.removeFromSuperview()
            rainDropView2.removeFromSuperview()
            rainDropView3.removeFromSuperview()
        }
    }
    
    func addDrizzle() {
        if !drizzleView.isDescendant(of: self) {
            self.addSubview(drizzleView)
        }
    }
    func removeDrizzle() {
        if drizzleView.isDescendant(of: self) {
            drizzleView.layer.removeAllAnimations()
            drizzleView.removeFromSuperview()
        }
    }
    func addFog() {
        if !fogView.isDescendant(of: self) {
            self.addSubview(fogView)
        }
    }
    func removeFog() {
        if fogView.isDescendant(of: self) {
            fogView.layer.removeAllAnimations()
            fogView.removeFromSuperview()
        }
    }
    func addSun(with pulsing : Bool) {
        if !sunView.isDescendant(of: self) {
            self.addSubview(sunView)
            
            if pulsing {
                sunPulsingView.add(animationGroup, forKey: "animgroup")
                sunPulsingView.frame.origin = CGPoint(x: sunView.layer.bounds.midX, y: sunView.layer.bounds.midY)
                sunView.layer.addSublayer(sunPulsingView)
                
               
            }
            
        }
    }
    func removeSun() {
        if sunView.isDescendant(of: self) {
            sunView.layer.removeAllAnimations()
            sunView.removeFromSuperview()
        }
    }
    func addSnow() {
        if !snowView.isDescendant(of: self) {
            self.addSubview(snowView)
            self.addSubview(snowView2)
        }
    }
    func removeSnow() {
        if snowView.isDescendant(of: self) {
            snowView.layer.removeAllAnimations()
            snowView.removeFromSuperview()
            
            snowView2.layer.removeAllAnimations()
            snowView2.removeFromSuperview()
        }
    }
    func addCloud() {
        if !imageViewCloud1.isDescendant(of: self) {
            self.addSubview(imageViewCloud1)
            self.addSubview(imageViewCloud2)
        }
    }
    func removeCloud() {
        
        if imageViewCloud1.isDescendant(of: self) {
            imageViewCloud1.layer.removeAllAnimations()
            imageViewCloud1.removeFromSuperview()
            
            imageViewCloud2.layer.removeAllAnimations()
            imageViewCloud2.removeFromSuperview()
        }
    }
    func startAnimation() {
        
        if imageViewCloud1.isDescendant(of: self) {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values =   [0,10,0,-10,0]
            animation.keyTimes = [0,0.30,0.50,0.70,1]
            animation.duration = 3
            animation.isAdditive = true
            animation.repeatCount = .infinity
            imageViewCloud1.layer.add(animation, forKey: "shake")

            let animation2 = CAKeyframeAnimation()
            animation2.keyPath = "position.x"
            animation2.values =   [0,-10,0,10,0]
            animation2.keyTimes = [0,0.30,0.50,0.70,1]
            animation2.duration = 3
            animation2.isAdditive = true
            animation2.repeatCount = .infinity
            imageViewCloud2.layer.add(animation2, forKey: "shake2")
        }
        
        if lightningView1.isDescendant(of: self) {
            let animation3 = CABasicAnimation()
            
            animation3.keyPath = "position.y"
            animation3.fromValue = lightningView1.frame.origin.y
            animation3.toValue = lightningView1.frame.origin.y + 30
            animation3.duration = 0.8
            animation3.repeatCount = .infinity

            lightningView1.layer.add(animation3, forKey: "lightning")
            animation3.duration = 0.6
            lightningView2.layer.add(animation3, forKey: "lightning2")
        }
        
        if rainDropView.isDescendant(of: self) {
            let animation3 = CABasicAnimation()
            animation3.keyPath = "position.y"
            animation3.fromValue = rainDropView.frame.origin.y
            animation3.toValue = rainDropView.frame.origin.y + 25
            animation3.duration = 0.6
            animation3.repeatCount = .infinity

            rainDropView.layer.add(animation3, forKey: "rainDrop1")
            animation3.duration = 0.7
            rainDropView2.layer.add(animation3, forKey: "rainDrop2")
            animation3.duration = 0.5
            rainDropView3.layer.add(animation3, forKey: "rainDrop2")
            
        }
        
        if snowView.isDescendant(of: self) {
            let animation3 = CABasicAnimation()
            animation3.keyPath = "position.y"
            animation3.fromValue = snowView.frame.origin.y
            animation3.toValue = snowView.frame.origin.y + 25
            animation3.duration = 0.6
            animation3.repeatCount = .infinity
            
            snowView.layer.add(animation3, forKey: "rainDrop1")
            animation3.duration = 0.7
            snowView2.layer.add(animation3, forKey: "rainDrop2")
        }
        
//        print("drop frame", rainDropView.frame)
//        print("cloud frame", imageViewCloud1.frame)
    }
    func stopAnimation() {
        
        imageViewCloud1.layer.removeAllAnimations()
        imageViewCloud2.layer.removeAllAnimations()
        lightningView1.layer.removeAllAnimations()
        lightningView2.layer.removeAllAnimations()
        rainDropView.layer.removeAllAnimations()
        rainDropView2.layer.removeAllAnimations()
        rainDropView3.layer.removeAllAnimations()
        snowView.layer.removeAllAnimations()
        snowView2.layer.removeAllAnimations()
    }
    
}
