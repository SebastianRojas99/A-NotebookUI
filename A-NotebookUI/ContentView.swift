//
//  ContentView.swift
//  A-NotebookUI
//
//  Created by Sebastian Marquez Rojas on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var login:PViewModel
    var body: some View {
        
        Group{
            if login.auth == 0{
                Login()
            }else if login.auth == 1{
                Home()
            }else if login.auth == 2 {
                VStack{
                    Text("usuario y/o cont incorrecto")
                    Button(action:{
                        login.auth = 0
                    }){
                        Text("Reintentar")
                    }
                }
            }
        }
    }
}

//#Preview {
  //  ContentView()
//}
