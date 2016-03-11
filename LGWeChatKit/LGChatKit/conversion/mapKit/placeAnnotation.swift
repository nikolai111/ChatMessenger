//
//  placeAnnotation.swift
//  LGWeChatKit
//
//  Created by Nikolai on 11/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation
import MapKit

class placeAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}