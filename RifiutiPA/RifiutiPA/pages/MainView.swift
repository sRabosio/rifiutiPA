//
//  ContentView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI
import MapKit


struct MainView: View {
    //property per la mappa
    @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 45.464098, longitude: 9.191926),
    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    var body: some View {
        NavigationView(){
            
        
            VStack(spacing: 50){
                Spacer()
                
                //Spacer()
                // Image(systemName: "globe")
                // .resizable()
                // .frame(width: 200, height: 200)
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: 400, height: 300)
                
                
                
                
                Text("Prenotazioni & Segnalazioni").font(.title)
                
                VStack(spacing: 20){
                    
                    HStack{
                        Image(systemName: "trash").foregroundColor(.blue)
                        
                        VStack{
                            Text("**Prenotazione**")
                            Text("id : 1010010 (Rifiuto grande Dimensioni)")
                            Text("Clicca per maggiori dettagli")
                                .foregroundColor(.blue)
                        }
                    }
                    HStack{
                        Image(systemName: "trash").foregroundColor(.blue)
                        VStack{
                            Text("**Segnalazione**")
                            Text("id : 1010010 (Cumulo rifiuti a Milano)")
                            Text("Clicca per maggiori dettagli")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                Spacer()
                HStack{
                    
                    NavigationLink(destination: PrenotazioneView()){
                        Text("prenota ritiro")
                            .padding()
                            .background(.white)
                            .cornerRadius(50)
                            
                    }
                        
                        
                    NavigationLink(destination: ReportView()){
                        Text("segnalazione")
                            .padding()
                            .background(.white)
                            .cornerRadius(50)
                            
                    }
                    
                    NavigationLink(destination: SettingsView()){
                        Text("impostazioni")
                            .padding()
                        .background(.white)
                        .cornerRadius(50)
                    }
                    
                    
                }.frame(maxWidth: .infinity)
                    .padding([.bottom], 70)
                    .padding([.top], 30)
                    .background(.blue)
                    .background(.white)
                    
                
            }
            
       }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
