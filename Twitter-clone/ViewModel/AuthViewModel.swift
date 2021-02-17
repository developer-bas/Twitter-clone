//
//  AuthViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 16/02/21.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    func login(){
        
    }
    
    func registerUser(email:String,password: String,username: String,fullname: String, profileImage:UIImage){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG ERROR \(error.localizedDescription)")
                return
            }
            print("Successfully signed user")
        }
    }
    
}
