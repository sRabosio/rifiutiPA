//
//  LandingView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView{
        VStack(spacing: 50){
        Spacer()
        Text("Benvenuto in RifiutiPA")
        .font(.largeTitle)
        .foregroundColor(.blue)
        
        Text("l'app dei servizi pubblici per richiedere ritiri a domicilio e segnalare rifiuti")
        .font(.body)
        Spacer()
        NavigationLink(destination: MainView()) {
                Text("procedi senza account")
        }
        Spacer()
        HStack(spacing: 30){
            NavigationLink(destination: LoginView()) {
                Text("Login")
                .foregroundColor(.white)
                .padding(8)
                .background(.blue) // Use a color as the background layer
                .cornerRadius(8)         
}
            NavigationLink(destination: RegistrationView()) {
                Text("Registrati")
                .foregroundColor(.white)
                .padding(8)
                .background(.blue) // Use a color as the background layer
                .cornerRadius(8)
                        
}
        }
        }
    }
    }
}


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
