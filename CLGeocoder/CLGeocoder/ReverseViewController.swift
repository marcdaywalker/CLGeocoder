//
//  ReverseViewController.swift
//  CLGeocoder
//
//  Copyright © 2016 MMApps. All rights reserved.
//

import UIKit
import MapKit

class ReverseViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    @IBAction func mapTapped(_ sender: UILongPressGestureRecognizer) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        let touchPoint = sender.location(in: mapView)
        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        mapView.addAnnotation(annotation)
        
        let location = CLLocation(latitude: newCoordinates.latitude, longitude: newCoordinates.longitude)
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemark = placemarks?.first {
                self.label.text = placemark.fullAddress
            }
        }
    }
}

