//
//  LoginView.swift
//  RifiutiPA
//
//  Created by user227417 on 9/28/22.
//

//STRUTTURA DATI UTENTE
struct UserData {
var mail: String = ""
var password: String = ""
var nome: String = "mail"
var cognome: String = ""
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
mail = ""
password = ""
}
}

//STRUTTURA DATI PER TEXTFIELDS
struct MyTextField: View {
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


import SwiftUI

struct LoginView: View {
    @State var userValue = UserData(nome: "", cognome: "")
    var body: some View {
        VStack {
            HStack{
Image(systemName: "trash.fill").foregroundColor(.blue)
Text("RifiutiPA")
        }.padding(20)
        .font(.largeTitle)
        Text("Login").font(.title)
VStack{
MyTextField(withIcon: "person.fill", textValue: $userValue.mail,
isMandatory: true, textHint: "mail")
MyTextField(withIcon: "key.fill", textValue: $userValue.password,
isMandatory: true, isSecret: true, textHint: "password")
NavigationLink(destination: RegistrationView()) {
                Text("Non hai un account? Registrati")
                .foregroundColor(.blue)
}
}
HStack(spacing: 50) {
    NavigationLink(destination: MainView()) {
        Text("Login").foregroundColor(.blue)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
