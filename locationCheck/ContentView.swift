//
//  ContentView.swift
//  locationCheck
//
//  Created by 杉浦圭相 on 2020/07/11.
//

import SwiftUI

let locationgetter = getLocation()

struct ContentView: View {

    @State var latitude = "setstatus"
    @State var longitude = "setstatus"
    @State var horizontalAccuracy = "Accuracy"
    @State var buttonStatus = "stop"
    @State var isTap:Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("Latitude:")
                Text(self.latitude)
            }
            HStack {
                Text("Longitude")
                Text(self.longitude)
            }
            HStack {
                Text("Accuracy")
                Text(self.horizontalAccuracy)
            }
            HStack {
                Button(action: {
                    if !isTap {
                        locationgetter.setupLocation()
                        buttonStatus = "started"
                        self.isTap = true
                    }
                }, label: {
                    Text(buttonStatus)
                })
                Button(action: {
                    if isTap {
                        locationgetter.locationRequest()
                        latitude = locationgetter.getLatitude()
                        longitude = locationgetter.getLongitude()
                        horizontalAccuracy = locationgetter.Accuracy
                    }
                }, label: {
                    Text("update")
                })
            }.offset(x: 0, y: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
