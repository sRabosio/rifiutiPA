//
//  rpa_StdFormField.swift
//  RifiutiPA
//
//  Created by user227417 on 10/5/22.
//

import SwiftUI

extension TextField{
    func std_FormField()->some View{
        self
            .font(.system(size:20))
            .background(.red)
            
            
    }    
}

struct rpa_StdFormField: View {
    @State var test:String;
    var body: some View {
        TextField("ciao", text: $test)
            .std_FormField()
    }
}

struct rpa_StdFormField_Previews: PreviewProvider {
    static var previews: some View {
        rpa_StdFormField(test: "amogus")
    }
}
