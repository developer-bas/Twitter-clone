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
        
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else {return}
        
        let filename = NSUUID().uuidString
        let storegeRef = Storage.storage().reference().child(filename)
        
        storegeRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("DEBUG: Fail to upload image")
                return
            }
            
            storegeRef.downloadURL { (url, _) in
                guard let profileImageURL = url?.absoluteString else {return}
             
                
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG ERROR \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else {return}
                    
                    let data = ["email":email,"username":username,"fullname":fullname, "profileImageUrl": profileImageURL,"uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { (_) in
                        print("DEBUG: SUCCESSFULLY UPLOADED DATA")
                    }
                    
                }
                
                
            }
            
        }
        
        
        
        
   
    }
    
}
