//
//  ViewController.swift
//  a211Map
//
//  Created by 申潤五 on 2020/12/19.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D =
CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan =
MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion =
MKCoordinateRegion.init(center: location, span: span)
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
}

