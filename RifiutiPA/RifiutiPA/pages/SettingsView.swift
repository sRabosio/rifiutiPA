//
//  SettingsView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI

struct SettingsView: View {
    @State var isPrenotazioneOn: Bool = true
    @State var isSegnalazioniOn: Bool = true
    @State var isPuntiOn: Bool = false
    
    var body: some View {
        VStack(alignment:.center, spacing: 5) {
            HStack(){
                rpa_StdArrow()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
            
            
            
            
            Text("Notifiche")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            
            
            
            
            VStack(spacing: 15){
                Toggle(isOn: $isPrenotazioneOn) {
                    HStack{
                    Image(systemName: isPrenotazioneOn ? "bell.fill" : "bell.slash")
                    .foregroundColor(.gray) 
                    Text("Prenotazioni")
                    }                    
                }.rpa_StdSwitch()
                
                Toggle(isOn: $isSegnalazioniOn) {
                    HStack{
                        Image(systemName: isSegnalazioniOn ? "exclamationmark.triangle.fill" : "exclamationmark.triangle")
                       .foregroundColor(.gray)  
                        Text("Segnalazioni")
                    } 
  
                }.rpa_StdSwitch()
                
                Toggle(isOn: $isPuntiOn) {
                    HStack{
                    Image(systemName: isPuntiOn ? "leaf.fill" : "leaf")
                        .foregroundColor(.green)    
                    Text("Punti")
                    }           
                }.rpa_StdSwitch()
            }
            
            VStack(spacing: 15){
                Text("Dati Personali")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(40)
                
                Button(action: {}) {
                    Text("Modifica dati personali")
                    Image(systemName: "pencil")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .opacity(1)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
            }
            
            
            VStack(){
                HStack{
                Text("Punti Eco")
                .font(.title)
                    
                    
                Image(systemName:"leaf.fill")
                .foregroundColor(.green)
                
                }
                .font(.system(size: 25))
                .frame(maxWidth: .infinity)
                .padding(60)
             ProgressBarWrapper()
                
            }
            
                
            
            
            
            Spacer()
            
        }.padding()
    }
    
    
    
    
    
    struct SettingsViewPreviews: PreviewProvider {
        static var previews: some View {
            SettingsView()
            
            
        }
    }
    
}
