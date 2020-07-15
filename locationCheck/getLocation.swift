//
//  getLocation.swift
//  locationCheck
//
//  Created by 杉浦圭相 on 2020/07/11.
//

import Foundation
import CoreLocation

class getLocation:NSObject, CLLocationManagerDelegate {

    var latitude: String = ""
    var longitude: String = ""
    var Accuracy: String = ""
    var locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        latitude = "setuplat"
        longitude = "setuplon"
    }
    
    func setupLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        debugPrint("location start")
    }
    
    func locationRequest() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
        debugPrint(latitude)
        debugPrint(longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus()
        switch status {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        case .denied:
            break
        case .notDetermined:
            manager.requestAlwaysAuthorization()
            break
        case .restricted:
            break
        default:
            break
        }

        let accuracyAuthorization = manager.accuracyAuthorization
        switch accuracyAuthorization {
        case .fullAccuracy:
            break
        case .reducedAccuracy:
            manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "aFewMiutes")
            break
        default:
            break
        }
    }
    
    func getLatitude() -> String {
        return latitude
    }
    
    func getLongitude() -> String {
        return longitude
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        latitude = String(location.coordinate.latitude)
        longitude = String(location.coordinate.longitude)
        Accuracy = String(location.horizontalAccuracy)
        debugPrint("getlocationTime: ",location.timestamp)
        debugPrint("locate",location.coordinate)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error)
    }
}
