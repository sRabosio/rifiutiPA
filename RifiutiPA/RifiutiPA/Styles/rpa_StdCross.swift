//
//  rpa_StdCross.swift
//  RifiutiPA
//
//  Created by user227417 on 10/5/22.
//

import SwiftUI

struct rpa_StdCross: View {
    var body: some View {
        Image(systemName: "cross.fill")
                    .rotationEffect(.degrees(45))
                .font(.largeTitle)
    }
}

struct rpa_StdCross_Previews: PreviewProvider {
    static var previews: some View {
        rpa_StdCross()
    }
}
