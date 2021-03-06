//
//  AuthViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 16/02/21.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: failed to loging \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func registerUser(email:String,password: String,username: String,fullname: String, profileImage:UIImage){
        
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else {return}
        
        let filename = NSUUID().uuidString
        let storegeRef = Storage.storage().reference().child(filename)
        
        storegeRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("DEBUG: Fail to upload image \(error)")
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
                    
                    let data = ["email":email,"username":username.lowercased(),"fullname":fullname, "profileImageUrl": profileImageURL,"uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { (_) in
                        self.userSession = user
                        self.fetchUser()
                    }
                }
            }
        }
    }
    func signOut(){
        self.userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, _) in
            guard let data = snapshot?.data() else {return}
            
            self.user = User(dictionary: data)
            
        }
    }
    
}
