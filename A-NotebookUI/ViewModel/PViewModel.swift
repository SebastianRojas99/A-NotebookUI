//
//  PViewModel.swift
//  A-NotebookUI
//
//  Created by Sebastian Marquez Rojas on 03/10/2023.
//

import Foundation
import SwiftUI

class PViewModel:ObservableObject{
    
    @Published var auth = 0
    
    init(){
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int{
            auth = sesion
        }else{
            auth = 0
        }
    }
    
    func login(email:String,password:String){
        
        guard let url = URL(string: "https://reqres.in/api/login") else {return}//la url de mentira
        let parameter = ["email":email,"password":password]//los parametros del login
        let body = try! JSONSerialization.data(withJSONObject: parameter)//el body de la consulta
        var request = URLRequest(url: url)//la request
        request.httpMethod = "POST"//el metodo
        request.httpBody = body//el cuerpo
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")//sirve para enviar la clave de tu microservicio
        
        URLSession.shared.dataTask(with: request){data,response,error in //para compartir la request con la url ya definida
            
            if let response = response{
                print(response)
            }
            
            guard let data = data else {return}
            
            do{
                let datos = try JSONDecoder().decode(PModel.self, from: data)
                if !datos.token.isEmpty{
                    DispatchQueue.main.async{
                        print(datos.token)
                        self.auth = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }//carga la aplicacion mientras lo de mas se carga en segundo plano
                }
            }catch let error as NSError{
                print("Error al hacer el post",error.localizedDescription)
                DispatchQueue.main.async{
                    self.auth = 2
                }
            }
            
        }.resume()
    }//para manejarse con internet
    
}
