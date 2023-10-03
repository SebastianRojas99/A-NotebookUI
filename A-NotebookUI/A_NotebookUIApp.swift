//
//  A_NotebookUIApp.swift
//  A-NotebookUI
//
//  Created by Sebastian Marquez Rojas on 30/09/2023.
//

import SwiftUI

@main
struct A_NotebookUIApp: App {
    var body: some Scene {
        let login = PViewModel()
        WindowGroup {
            ContentView().environmentObject(login)//para propagar el login
        }
    }
}
