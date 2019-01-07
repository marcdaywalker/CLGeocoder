When working with maps, 2 of the most common operations are the search of locations and getting the name of a certain direction based on its coordinates
A quick and easy way to get this by using a CLGeocoder object which is inside MapKit framework.
Firstly, let's search an address and we will get a list of matches. This matches will be an array of CLPlacemark object where it has the details of a location, such as, street, city, country, etc. We need to use a String parameter with the address we want to search and the method geocodeAddressString(_ addressString: String, completionHandler: CoreLocation.CLGeocodeCompletionHandler) will return a list of address or an error.
In general the errors will appear because no locations where found, but you can check the amount of listed placemarks or if it is null. There's a limitation of use and after a few times (Apple doesn't specify how many) it will return a kCLErrorNetwork error.

```
let geocoder = CLGeocoder()
let text = "Chamartin"
geocoder.geocodeAddressString(text) { (placemarks, error) in
     guard let placemarks = placemarks, placemarks.count > 0 else {
          // not found
     }
            
     placemarks.forEach({ (placemark) in
          // do something
     })
}
```

If we want to center the search in a certain region, we can use the method geocodeAddressString(_ addressString: String, in region: CLRegion?, completionHandler: CoreLocation.CLGeocodeCompletionHandler) where we can indicate the region using a CLRegion object.

```
let geocoder = CLGeocoder()
let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude:40.4168, longitude:3.7038), radius: 10000, identifier: "")
let text = "Chamartin"
geocoder.geocodeAddressString(text, in: region) { (placemarks, error) in
     guard let placemarks = placemarks, placemarks.count > 0 else {
          // not found
     }
            
     placemarks.forEach({ (placemark) in
          // do something
     })
}
```

We can also use the address formatted using the ContactBook style, that way it will be easier to identify each field. To do that we will use the method func geocodeAddressDictionary(_ addressDictionary: [AnyHashable : Any], completionHandler: CoreLocation.CLGeocodeCompletionHandler). In order to use CNPostalAddress keywords import Contacts must be added to your code.

```
let dic = [CNPostalAddressStreetKey:"Gran Via", CNPostalAddressCityKey:"Madrid"]
geocoder.geocodeAddressDictionary(dic) { (placemarks, error) in
     guard let placemarks = placemarks, placemarks.count > 0 else {
          // not found
     }
            
     placemarks.forEach({ (placemark) in
          // do something
     })
}
```

Finally, with the method func reverseGeocodeLocation(_ location: CLLocation, completionHandler: CoreLocation.CLGeocodeCompletionHandler) we can get the oppossite result, that is, the address from a given coordinate.

```
let geocoder = CLGeocoder()
let location = CLLocation(latitude:40.4168, longitude:3.7038)
geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
     guard let placemarks = placemarks, placemarks.count > 0 else {
          // not found
     }
            
      placemarks.forEach({ (placemark) in
          // do something
     })
}
```
Do you want to this working? Click here to see the whole project
