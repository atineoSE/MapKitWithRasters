//
//  MapOverlay.swift
//  MapKitLabelsFeedbackSampleProject
//
//  Created by Adrian Tineo on 26.06.20.
//

import Foundation
import MapKit

class MapOverlay: MKTileOverlay {
    let map: Map
    
    internal init(map: Map) {
        self.map = map
        super.init(urlTemplate: nil)
    }

    override func url(forTilePath path: MKTileOverlayPath) -> URL {
        if map.covers(x: path.x, y: path.y, z: path.z) {
            //print("dispatching gray tile for x: \(path.x), y: \(path.y), z: \(path.z)")
            return Bundle.main.url(
            forResource: "default_tile_gray",
            withExtension: "png",
            subdirectory: "Tiles",
            localization: nil)!
        } else {
            //print("dispatching transparent tile for x: \(path.x), y: \(path.y), z: \(path.z)")
            return Bundle.main.url(
            forResource: "default_tile_transparent",
            withExtension: "png",
            subdirectory: "Tiles",
            localization: nil)!
        }
    }
}
