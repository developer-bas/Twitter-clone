//
//  SearchViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 18/02/21.
//
import Firebase
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }

    func fetchUsers(){
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            
            //self.users = documents.map({ User(dictionary: $0.data())})
            
            documents.forEach { (doc) in
                let user = User(dictionary: doc.data())
                self.users.append(user)
            }
        }
    }
}
