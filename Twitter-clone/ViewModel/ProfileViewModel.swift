//
//  ProfileViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 20/02/21.
//

import Firebase
import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow(){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]){ _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]){_ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow(){
        
    }

}
