//
//  ContentView.swift
//  Park-Play-Sports
//
//  Created by jimenez on 2/27/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.05), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        NavigationView {
            TabView {
                HomePageView(region: $region)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePageView: View {
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        ZStack {
            Color(.init(red: 0.2, green: 0.6, blue: 0.5, alpha: 0.9))
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Park Play Sports")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(2)
                
                Text("Discover, Play, You")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                
                Spacer()
                
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                //                            .frame(width: 400, height: 300)
                    .frame(width: 300, height: 400)
                    .cornerRadius(10)
                //                    .padding()
                Spacer()
                
            }
        }
        .tabItem() {
            Label("Order", systemImage: "square.and.pencil")
        }
    }
}
