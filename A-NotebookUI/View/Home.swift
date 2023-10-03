//
//  Home.swift
//  A-NotebookUI
//
//  Created by Sebastian Marquez Rojas on 03/10/2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var sesionToken:PViewModel
    @ObservedObject var login = PViewModel()
    var body: some View {
        
        ZStack{
            VStack{
                NavigationStack{
                    Text("Bienvenido").bold().font(.headline)
                        .navigationTitle("A-NotebookUI")
                    Button(action:{
                        sesionToken.auth = 0
                    }){
                        Text("cerrar sesion")
                    }
                }
            }

        }  
    }
}

#Preview {
    Home()
}
