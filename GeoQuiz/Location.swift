//
//  Location.swift
//  GeoQuiz
//
//  Created by Naghmeh on 12/8/16.
//  Copyright © 2016 Naghmeh. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Location: NSObject, MKAnnotation{
    
    var title: String?
    var capital: String?
    let coordinate: CLLocationCoordinate2D

    
    init(country: String, capital: String, coordinate: CLLocationCoordinate2D) {
        
        self.title = country
        self.capital = capital
        self.coordinate = coordinate
        super.init()
        
    }
    func getCapital()-> String
    {
        return capital!
    }
    
}
