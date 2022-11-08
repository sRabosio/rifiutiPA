//
//  PopMessage.swift
//  RifiutiPA
//
//  Created by user227417 on 10/17/22.
//

import SwiftUI

struct PopMessage: View {

    var title:String
    var text:String
    var buttonText:String

    init(title:String, text:String, buttonText:String){
        self.title = title
        self.text = text
        self.buttonText = buttonText
    }

    var body: some View {
        VStack{
            Text(title)
            .font(.title)
            .padding(15)
            Text(text)
            Button(action:{}, label:{
                Text(buttonText)
            }).rpa_StdButton()
        }
        .padding(20)
        .border(.black, width: 2)
    }
}

struct PopMessage_Previews: PreviewProvider {
    static var previews: some View {
        PopMessage(title: "ciao", text: "ciaociaociaociaociaociao", buttonText: "ok")
    }
}
