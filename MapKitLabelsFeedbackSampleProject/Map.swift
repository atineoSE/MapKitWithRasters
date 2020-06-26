//
//  Map.swift
//  MapKitLabelsFeedbackSampleProject
//
//  Created by Adrian Tineo on 26.06.20.
//

import Foundation
import MapKit

struct Map {
    let name: String
    let center: CLLocationCoordinate2D
    let initialSpan: MKCoordinateSpan
}

extension Map {
    func covers(x: Int, y: Int, z: Int) -> Bool {
        switch z {
        case 6:
            return 22...27 ~= y && 27...33 ~= x
        case 7:
            return 45...55 ~= y && 55...66 ~= x
        case 8:
            return 90...100 ~= y && 110...132 ~= x
        case 9:
            return 181...223 ~= y && 221...264 ~= x
        default: return false
        }
    }
}

