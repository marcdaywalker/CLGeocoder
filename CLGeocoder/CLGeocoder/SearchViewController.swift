//
//  SearchViewController.swift
//  CLGeocoder
//
//  Copyright © 2016 MMApps. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        mapView.removeAnnotations(mapView.annotations)
        
        if let text = textField.text {
            CLGeocoder().geocodeAddressString(text, completionHandler: { (placemarks, error) in
                placemarks?.forEach({ (placemark) in
                    if let coordinate = placemark.location?.coordinate {
                        
                        let pin = MKPointAnnotation()
                        pin.coordinate = coordinate
                        self.mapView.addAnnotation(pin)
                    }
                })
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            })
        }
        
        return true
    }
}
