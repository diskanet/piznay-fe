//
//  MKMapViewExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 22.11.2023.
//

import MapKit

extension MKMapView {
    func getCoordinatesByCenterPoint(on mapView: MKMapView) -> CLLocationCoordinate2D {
        let centerPoint = CGPoint(x: mapView.bounds.midX, y: mapView.bounds.midY)
        let coordinates = mapView.convert(centerPoint, toCoordinateFrom: mapView)
        return coordinates
    }
     
    func getGeolocationData(by coordinates: CLLocationCoordinate2D, completion: @escaping ([String: String]) -> Void) {
        var geoData: [String: String] = [:]
        
        let geolocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(geolocation) { (placemark, error) in
            if let error = error {
                print("Error geocoding location: \(error.localizedDescription)")
            } else if let placemark = placemark?.first {
                geoData = [
                    "latitude": coordinates.latitude.description,
                    "longitude": coordinates.longitude.description,
                    "coordinates": "\(String(format: "%.6f", coordinates.latitude)), \(String(format: "%.6f", coordinates.longitude ))",
                    "thoroughfare": placemark.thoroughfare ?? "",
                    "locality": placemark.locality ?? "Unknown locality",
                    "country": placemark.country ?? "Unknown country",
                    "location": "\(placemark.locality ?? "Unknown locality"), \(placemark.country ?? "Unknown country")",
                ]
                completion(geoData)
            }
        }
    }
    
    func addAnnotation(to mapView: MKMapView, at coordinates: CLLocationCoordinate2D) -> MKPointAnnotation {
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = coordinates
        mapView.addAnnotation(newAnnotation)
        return newAnnotation
    }

    func removeAnnotation(_ annotation: MKPointAnnotation?, from mapView: MKMapView) {
        if let existingAnnotation = annotation {
            mapView.removeAnnotation(existingAnnotation)
        }
    }
    
    func zoomIn(mapView: MKMapView) {
        var region = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    
    func zoomOut(mapView: MKMapView) {
        var region = mapView.region
        region.span.latitudeDelta *= 2.0
        region.span.longitudeDelta *= 2.0
        mapView.setRegion(region, animated: true)
    }
}
