//
//  ContentView.swift
//  Park-Play-Sports
//
//  Created by jimenez on 2/27/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.77, longitude: -122.419), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            TabView {
                HomePageView(region: $region)
                
                ExtractedView()
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    // Show the text after 2 seconds
                    withAnimation {
//                        self.isPresented = true
                    }
                }
            }
            .alert(isPresented: $isPresented) {
                Alert(title: Text("Get Premuim"), message: Text("Hurry!! Before the offer is Gone"))
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
            Label("Map", systemImage: "map")
        }
    }
}

struct ExtractedView: View {
    @State private var userTextField = ""
    @State private var locationTextField = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.init(red: 0.2, green: 0.6, blue: 0.5, alpha: 0.9))
                    .ignoresSafeArea()
                VStack {
                    
                    Spacer()
                    
                    HStack() {
                        Text("Name")
                            .frame(minWidth: 200, alignment: .leading)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                        TextField("Name", text: $userTextField)
                            .padding()
                            .frame(minWidth: 100)
                    }
                    .background(.white)
                    
                    HStack() {
                        Text("Location")
                            .frame(minWidth: 200, alignment: .leading)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                        TextField("Location", text: $locationTextField)
                            .padding()
                            .frame(minWidth: 100)
                    }
                    .background(.white)
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            HStack() {
                                Text("Locatonasd")
                                    .frame(minWidth: 200, alignment: .leading)
                                    .fontWeight(.bold)
                                    .padding(.leading, 20)
                                TextField("Location", text: $userTextField)
                                    .padding()
                                    .frame(minWidth: 100)
                            }
                            .background(.white)
                            HStack() {
                                Text("THere is nothing here bozo")
                                    .frame(minWidth: 200, alignment: .leading)
                                    .fontWeight(.bold)
                                    .padding(.leading, 20)
                                TextField("Name", text: $userTextField)
                                    .padding()
                                    .frame(minWidth: 100)
                            }
                            .background(.white)
                            HStack() {
                                Text("Nothing is also jere asdnasdjlsajdnsja asjdnlasjnd asjdlna")
                                    .frame(minWidth: 200, alignment: .leading)
                                    .fontWeight(.bold)
                                    .padding(.leading, 20)
                                TextField("Name", text: $userTextField)
                                    .padding()
                                    .frame(minWidth: 100)
                            }
                            .background(.white)
                        }
                        .blur(radius: 10)
                        
                        Text("Subscibe to see Detailed Statistics")
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }
                    Spacer()
                }
            }
            .navigationTitle(Text("User"))
        }
        .tabItem() {
            Label("User" , systemImage: "person")
        }
    }
}
