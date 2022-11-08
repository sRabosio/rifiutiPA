//
//  RegistrationView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

import SwiftUI

struct User_Data {
var mail: String = ""
var password: String = ""
var nome: String = ""
var cognome: String = ""
var cf: String = ""
var via: String = ""
var citta: String = ""

var punti: Int = 0
var isAllMandatoryFiledsEmpty: Bool {
return mail.isEmpty || password.isEmpty
}
var isAnyMandatoryFiledsEmpty: Bool {
return mail.isEmpty && password.isEmpty && nome.isEmpty && cognome.isEmpty
}
mutating func emptyFileds() {
nome = ""
cognome = ""
cf = ""
mail = ""
password = ""
citta = ""
via = ""

}
}
struct MyText_Field: View {
var withIcon: String
@Binding var textValue: String
var isMandatory: Bool = false
var isSecret: Bool = false
var textHint: String
var body: some View {
HStack {
Image(systemName: withIcon)
if isSecret {
SecureField(textHint, text: $textValue)
}
else {
TextField(textHint, text: $textValue)
}
}
.padding()
.overlay(RoundedRectangle(cornerRadius: 8)
.stroke(isMandatory && textValue.isEmpty ? .red : .blue, lineWidth: 1))
.padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
}
}

struct RegistrationView: View {
     @State var userValue = User_Data(nome: "", cognome: "")
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Image(systemName: "trash.fill").foregroundColor(.blue)
                    Text("RifiutiPA")
                }.padding(20)
                    .font(.largeTitle)
                Text("Registrazione").font(.title)
                VStack{
                    MyText_Field(withIcon: "person.fill", textValue: $userValue.nome,
                                 isMandatory: true, textHint: "nome")
                    MyText_Field(withIcon: "person.fill", textValue: $userValue.cognome,
                                 isMandatory: true, textHint: "cognome")
                    MyText_Field(withIcon: "circle.fill", textValue: $userValue.cf,
                                 isMandatory: true, textHint: "codice fiscale")
                    MyText_Field(withIcon: "house.fill", textValue: $userValue.citta,
                                 isMandatory: true, textHint: "città")
                    MyText_Field(withIcon: "location.fill", textValue: $userValue.via,
                                 isMandatory: true, textHint: "indirizzo")
                    MyText_Field(withIcon: "mail.fill", textValue: $userValue.mail,
                                 isMandatory: true, textHint: "mail")
                    MyText_Field(withIcon: "key.fill", textValue: $userValue.password,
                                 isMandatory: true, isSecret: true, textHint: "password")
                    NavigationLink(destination: LoginView()) {
                        Text("Hai già un account? Accedi")
                            .foregroundColor(.blue)
                    }
                }
                HStack(spacing: 50) {
                    NavigationLink(destination: MainView()) {
                        Text("Registrati").foregroundColor(.blue)
                    }
                    .disabled(userValue.isAllMandatoryFiledsEmpty)
                    Button("Pulisci") {
                        userValue.emptyFileds()
                    }.foregroundColor(.white)
                        .padding(8)
                        .background(.blue) // Use a color as the background layer
                        .cornerRadius(8)
                        .disabled(userValue.isAnyMandatoryFiledsEmpty)
                }
            }

    }
}
    }


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
