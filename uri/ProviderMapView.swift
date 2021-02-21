//
//  ProviderMapView.swift
//  uri
//
//  Created by user175571 on 2/21/21.
//

import SwiftUI
import MapKit

struct ProviderMapView: View {
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.88715, longitude: -97.04404), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let markers = [marker(named: "1", latitude: 32.96773, longitude: -97.13125, color: .gray), marker(named: "2", latitude: 32.98047, longitude: -97.00058, color: .green), marker(named: "3", latitude: 32.85617, longitude: -97.16375, color: .gray), marker(named: "4", latitude: 32.72081, longitude: -97.10330, color: .gray), marker(named: "5", latitude: 32.75777, longitude: -96.86366, color: .gray)]
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $coordinateRegion, annotationItems: markers){place in
                MapMarker(coordinate: place.coordinate, tint: place.color)
            }.ignoresSafeArea(.all)
            VStack{
                Text("Today's Next Jobs").font(.title).bold().padding().background(Color.white).cornerRadius(10.0).shadow(radius: 10.0)
                Spacer()
            }.padding()
        }
    }
}

struct ProviderMapView_Previews: PreviewProvider {
    static var previews: some View {
        ProviderMapView()
    }
}

struct marker:Identifiable {
    var id = UUID()
    let named: String
    let latitude: Double
    let longitude: Double
    let color: Color
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
