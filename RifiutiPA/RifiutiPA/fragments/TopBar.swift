//
//  TopBar.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        NavigationView{
            HStack(alignment: .center){
                Text("RifiutiPA")
                    .bold(true)
                    .frame(maxWidth: .infinity,alignment: .center)
                
                Spacer()
                
                
                NavigationLink(destination: SettingsView()){
                        Image(systemName: "person.circle")
                }
                .padding(.trailing, 20)
                
            }.font(.largeTitle)
                //.foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding([.top], 50)
                .padding([.bottom], 20)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
