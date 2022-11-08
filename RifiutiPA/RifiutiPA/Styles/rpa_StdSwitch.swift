//
//  rpa_StdSwitch.swift
//  RifiutiPA
//
//  Created by user227417 on 10/5/22.
//

import SwiftUI

extension Toggle{
    func rpa_StdSwitch()-> some View{
        self
            .tint(.blue)
            .frame(maxWidth:200)
    }
}

struct rpa_StdSwitch: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct rpa_StdSwitch_Previews: PreviewProvider {
    static var previews: some View {
        rpa_StdSwitch()
    }
}
