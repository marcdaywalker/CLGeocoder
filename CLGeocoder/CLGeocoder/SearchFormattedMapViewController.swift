//
//  SearchFormattedMapViewController.swift
//  CLGeocoder
//
//  Copyright © 2016 MMApps. All rights reserved.
//

import UIKit
import MapKit

class SearchFormattedMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var placemarks: [CLPlacemark]?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        placemarks?.forEach({ (placemark) in
            if let coordinate = placemark.location?.coordinate {
                let pin = MKPointAnnotation()
                pin.coordinate = coordinate
                self.mapView.addAnnotation(pin)
            }
        })
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}
