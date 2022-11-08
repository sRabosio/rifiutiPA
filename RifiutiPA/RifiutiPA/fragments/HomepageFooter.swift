//
//  HomepageFooter.swift
//  RifiutiPA
//
//  Created by user227417 on 10/1/22.
//

import SwiftUI

struct HomepageFooter: View {
    var body: some View {
        HStack{
            
            NavigationLink(destination: PrenotazioneView()){
                Button("prenota ritiro", action:{})
                    .rpa_StdButton()
            }
                
                
                Button("segnala rifiuto", action:{})
            
            
        }.frame(maxWidth: .infinity)
            .padding([.bottom], 70)
            .padding([.top], 30)
            .background(.blue)
            .background(.white)
            
        
    }
}

struct HomepageFooter_Previews: PreviewProvider {
    static var previews: some View {
        HomepageFooter()
    }
}
