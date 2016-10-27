//
//  SearchFormattedFormViewController.swift
//  CLGeocoder
//
//  Copyright © 2016 MMApps. All rights reserved.
//

import UIKit
import Contacts
import MapKit

class SearchFormattedFormViewController: UIViewController {
    @IBOutlet weak var streetTxtField: UITextField!
    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    
    private var _placemarks: [CLPlacemark]?
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        guard let street = streetTxtField.text,
            let city = cityTxtField.text,
            let country = countryTxtField.text else {
            return
        }
        
        let dic = [CNPostalAddressStreetKey:street, CNPostalAddressCityKey:city, CNPostalAddressCountryKey: country]
        
        CLGeocoder().geocodeAddressDictionary(dic) { (placemarks, error) in
            self._placemarks = placemarks
            self.performSegue(withIdentifier: "show_map_segue", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SearchFormattedMapViewController {
            controller.placemarks = _placemarks
        }
    }
}
