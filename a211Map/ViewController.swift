//
//  ViewController.swift
//  a211Map
//
//  Created by 申潤五 on 2020/12/19.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager:CLLocationManager? = nil
    
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        if let coordinate = locationManager?.location?.coordinate{
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: xScale, longitudeDelta: yScale)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            self.myMap.setRegion(region, animated: true)
        }

        
        

    }


    @IBAction func mapTypeSelect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            myMap.mapType = .standard
        case 1:
            myMap.mapType = .satellite
        case 2:
            myMap.mapType = .hybrid
        default:
            break
        }
        
    }
    
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        print("longPress")
        let touchPoint = sender.location(in: myMap)
        print(touchPoint)
        let location = myMap.convert(touchPoint, toCoordinateFrom: myMap)
        print(location)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自選點"
        self.myMap.addAnnotation(annotation)


    }
    
    
}

