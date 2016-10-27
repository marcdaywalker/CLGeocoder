//
//  CLPlacemark.swift
//  CLGeocoder
//
//  Copyright © 2016 MMApps. All rights reserved.
//

import Foundation
import MapKit

extension CLPlacemark {
    var fullAddress: String {
        var string = ""
        if let lines = self.addressDictionary?["FormattedAddressLines"] as? [Any] {
            if let lines = lines as? [String] {
                for line in lines {
                    string.append(String("\(line), "))
                }
            }
        }
        return string.substring(to:string.index(string.endIndex, offsetBy: -2))
    }
}
