//
//  MapVC.swift
//  CDPlayerSwift
//
//  Created by CDPlayer on 2016/12/13.
//  Copyright © 2016年 CDPlayer. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController ,CLLocationManagerDelegate,MKMapViewDelegate{

    let mapView : MKMapView
    let locationMgr : CLLocationManager
    
    init() {
        mapView = MKMapView.init(frame: UIScreen.main.bounds)
        locationMgr = CLLocationManager.init()
        
        super.init(nibName: nil, bundle: nil)
        
        self.myMap()
        self.myLocation()
        
        let bkBtn : UIButton = UIButton.init(frame: CGRect.init(x: 10, y: 20, width: 50, height: 50))
        bkBtn.setTitle("返回", for: UIControlState.normal)
        bkBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        bkBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        bkBtn.backgroundImage(for: UIControlState.normal)
        bkBtn.layer.cornerRadius = 15.0
        bkBtn.clipsToBounds = true
        bkBtn.setBackgroundImage(UIImage.init(named: "mapImg.png"), for: UIControlState.normal)
        bkBtn.addTarget(self, action: #selector(backFunc), for: UIControlEvents.touchUpInside)
        self.view.addSubview(bkBtn)
        
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(backTransform))
        mapView.addGestureRecognizer(gesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @objc func backFunc() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func backTransform() -> Void {
        UIView.animate(withDuration: 0.2, animations: {
            self.mapView.transform = CGAffineTransform.init(translationX: 0, y: 0)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myLocation() -> Void {
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.distanceFilter = 1.0
        locationMgr.delegate = self
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined {
            locationMgr .requestWhenInUseAuthorization()
        }
        locationMgr.startUpdatingLocation()
    }
    
    func myMap() -> Void {
        
        mapView.delegate = self
        self.view.addSubview(mapView)
    }

// MARK: CLLocationManagerDelegate 代理 didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location : CLLocation? = locations.first
        print("\(location?.coordinate.latitude),\(location?.coordinate.longitude)")
        let region : MKCoordinateRegion? = MKCoordinateRegion.init(center: (location?.coordinate)!, span: MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region!, animated: true)
        
        // 添加一个大头针
        let point : MKPointAnnotation = MKPointAnnotation.init()
        point.coordinate = (location?.coordinate)!
        
        point.title = "标题"
        point.subtitle = "副标题"
        
        mapView.addAnnotation(point)
        mapView.selectAnnotation(point, animated: true)
        
        locationMgr.stopUpdatingLocation()
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView : MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: "CDKINGSWIFTANNOTATION") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView.init(annotation: annotation, reuseIdentifier: "CDKINGSWIFTANNOTATION")
        }
        
        let btn : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        btn.backgroundColor = UIColor.blue
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitle("左视图", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(leftViewAction), for: UIControlEvents.touchDown)
        annotationView?.leftCalloutAccessoryView = btn
        
        annotationView?.canShowCallout = true
        
        annotationView?.animatesDrop = true
        
        let btn2 : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        btn2.backgroundColor = UIColor.orange
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn2.setTitle("右视图", for: UIControlState.normal)
        btn2.addTarget(self, action: #selector(rightViewAction), for: UIControlEvents.touchDown)
        annotationView?.rightCalloutAccessoryView = btn2
        
        annotationView?.pinTintColor = UIColor.purple

        return annotationView

    }
    
    @objc func leftViewAction() -> Void {
        print("左视图被点击")
        UIView.animate(withDuration: 0.3, animations: {
            self.mapView.transform = CGAffineTransform.init(translationX: UIScreen.main.bounds.size.width/2, y: 0)
        })
    }
    
    @objc func rightViewAction() -> Void {
        print("右视图被点击")
        UIView.animate(withDuration: 0.3, animations: {
            self.mapView.transform = CGAffineTransform.init(translationX: -1*UIScreen.main.bounds.size.width/2, y: 0)
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
