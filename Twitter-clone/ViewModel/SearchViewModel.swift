//
//  SearchViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 18/02/21.
//
import Firebase
import SwiftUI

enum SearchViewModelConfiguration{
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration){
        self.config = config
        fetchUsers(forConfig: config)
    }

    func fetchUsers(forConfig config: SearchViewModelConfiguration){
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            
            let users = documents.map({ User(dictionary: $0.data())})
            
            switch config{
            
            case .search:
                self.users = users
                
//                documents.forEach { (doc) in
//                    let user = User(dictionary: doc.data())
//                    self.users.append(user)
//                }
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
            }
            
           
        }
    }
    
    func filteredUsers(_ query: String) -> [User]{
        let lowercasedQuery = query.lowercased()
        return users.filter({$0.fullname.lowercased().contains(lowercasedQuery ) || $0.username.lowercased().contains(lowercasedQuery) })
    }
    
}
