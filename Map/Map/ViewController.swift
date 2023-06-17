//
//  ViewController.swift
//  Map
//
//  Created by JOHNNY_MAC_1 on 2023/03/02.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    // ----- Global Variables -----
    let locationManager = CLLocationManager()
    
    // ----- Outlet Variables -----
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    func initialize()
    {
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }

    func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longtitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "Current Location"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees,
                       delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtitudeValue: longtitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // ----- Actions -----
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            setAnnotation(latitudeValue: 25.127825604095282, longtitudeValue: 121.77970822132106, delta: 0.01, title: "HsinTing's Home", subtitle: "Keelung, Taiwan")
            lblLocationInfo1.text = "Location"
            lblLocationInfo2.text = "HsinTing's Home"
        case 2:
            setAnnotation(latitudeValue: 36.801060, longtitudeValue: 127.109229, delta: 0.01, title: "My Home", subtitle: "11, Buldang14-ro, Seobuk-gu, Cheonan-si, Chungcheongnam-do")
            lblLocationInfo1.text = "Location"
            lblLocationInfo2.text = "My Home"
        default:
            lblLocationInfo1.text = ""
            lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
    }
}

