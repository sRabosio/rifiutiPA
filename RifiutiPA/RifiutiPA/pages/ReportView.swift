//
//  SettingsView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI
import MapKit


struct ReportView: View {

    var wastes = ["Rifiuti urbani", "Rifiuti speciali", "Rifiuti pericolosi", "Rifiuti urbani pericolosi", "Rifiuti speciali pericolosi"]

    @State private var selectedWaste = "Rifiuti urbani"
    @State private var wasteAddress = ""
    @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 45.464098, longitude: 9.191926),
    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))


    var body: some View {


        VStack (){
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            Spacer()

            
            NavigationLink(destination: MainView()) {
                Button(action: {}, label: {
                    rpa_StdCross()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                })
            }



            VStack {
                Text("Segnalazione rifiuti")
                .font(.title)
                Spacer(minLength: 10)
                .frame(height: 50)
                Picker("Tipo rifiuto", selection: $selectedWaste) {
                    ForEach(wastes, id: \.self) {
                        Text($0)
                    }
                }.background(.white)
                 .cornerRadius(12)

            }.foregroundColor(.blue)
            

            Text("Hai selezionato: \(selectedWaste)")

            TextField("Indirizzo rifiuti", text: $wasteAddress)
            .textFieldStyle(.roundedBorder) 
            .multilineTextAlignment(.center)
            .padding()


            // IMAGE



            Button( action:{}){
                Label("Camera", systemImage: "camera")
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(23)


           Button("Segnala", action:{})
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(23)

 
                
            


            

        }.padding()

    }
}






struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
