//
//  Login.swift
//  A-NotebookUI
//
//  Created by Sebastian Marquez Rojas on 03/10/2023.
//

import SwiftUI

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login:PViewModel
    
    
    var body: some View {
        
            ZStack{
                Color(.blue).ignoresSafeArea(.all)
                Image("newlogin").resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                
                        Text("Email").foregroundStyle(.white).bold()
                    TextField("Email", text: $email).background(Color.white).textFieldStyle(.roundedBorder).keyboardType(.emailAddress)
                        Text("Password").foregroundStyle(.white).bold()
                    SecureField("Password", text: $password).background(Color.white).textFieldStyle(.roundedBorder).keyboardType(.emailAddress).background(Color.gray)
                    
                    Button(action:{
                        login.login(email: email, password: password)
                    }){
                        
                        Text("Enviar").foregroundStyle(.white).bold()
                    }.buttonStyle(.bordered).background(.blue).clipShape(.buttonBorder)
                }.padding(.all)
            }
        
        
    }
}

#Preview {
    Login()
}
