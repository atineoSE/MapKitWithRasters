//
//  ViewController.swift
//  MapKitLabelsFeedbackSampleProject
//
//  Created by Adrian Tineo on 26.06.20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var map = Map(name: "Spain",
                  center: CLLocationCoordinate2D(latitude: 37.53912356921809, longitude: -5.019229832416068),
                  initialSpan: MKCoordinateSpan(latitudeDelta: 35.0, longitudeDelta: 35.0))
    var tileRenderer: MKTileOverlayRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    private func setupMap() {
        mapView.delegate = self

        let overlay = MapOverlay(map: map)
        overlay.canReplaceMapContent = true
        tileRenderer = MKTileOverlayRenderer(tileOverlay: overlay)
        mapView.addOverlay(overlay, level: .aboveLabels)
        
        overlay.minimumZ = 6
        overlay.maximumZ = 9
        
        let initialRegion = MKCoordinateRegion(
            center: map.center,
            span: map.initialSpan)

        mapView.cameraZoomRange = MKMapView.CameraZoomRange(
          minCenterCoordinateDistance: 100_000,
          maxCenterCoordinateDistance: 10_000_000)

        mapView.region = initialRegion
        mapView.showsUserLocation = false
        mapView.showsCompass = true
    }
}

// MARK: MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return tileRenderer
    }
}

