//
//  ProvaView.swift
//  RifiutiPA
//
//  Created by user227417 on 10/5/22.
//


import SwiftUI
import MapKit


struct ProvaView: View {
    var body: some View {
        ZStack {
            MapView()
        }
        .edgesIgnoringSafeArea(.all)
    }
}



class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}


class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapViewController: MapView
    


    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor
       annotation: MKAnnotation) -> MKAnnotationView?{
        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circle = MKCircleRenderer(overlay: overlay)
        return circle
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let v = view.annotation as? LandmarkAnnotation {
            print(v.coordinate)
        }
    }
}


struct MapView: UIViewRepresentable {
    
    var markers: [CLLocationCoordinate2D] = [CLLocationCoordinate2D(
                                                latitude: 34.055404, longitude: -118.249278),CLLocationCoordinate2D(
                                                    latitude: 34.054097, longitude: -118.249664), CLLocationCoordinate2D(latitude: 34.053786, longitude: -118.247636)]
    var convertedMarkers: [LandmarkAnnotation] = []
    
    init() {
        convertedMarkers = cordToMark(locations: self.markers)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func cordToMark(locations: [CLLocationCoordinate2D]) -> [LandmarkAnnotation] {
        var marks: [LandmarkAnnotation] = []
        for cord in locations {
            let mark = LandmarkAnnotation(title: "Test", subtitle: "Sub", coordinate: cord)
            marks.append(mark)
        }
        return marks
    }
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        let coordinate = CLLocationCoordinate2D(
            latitude: 45.464664, longitude:  9.188540)
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = coordinate
        mapCamera.pitch = 10
        mapCamera.altitude = 3000
        view.camera = mapCamera
        view.mapType = .mutedStandard
        view.delegate = context.coordinator
        view.addAnnotations(self.convertedMarkers)
        let radiusCircle = MKCircle(center: CLLocationCoordinate2D(
                                        latitude: 34.0537767, longitude: -118.248), radius: 300 as CLLocationDistance)
        view.addOverlay(radiusCircle)
        let locationCircle = MKCircle(center: CLLocationCoordinate2D(
                                        latitude: 34.0537767, longitude: -118.248), radius: 3 as CLLocationDistance)
        view.addOverlay(locationCircle)
    }
    
}


struct ProvaView_Previews: PreviewProvider {
    static var previews: some View {
        ProvaView()
            .environment(\.colorScheme, .light)
    }
}

