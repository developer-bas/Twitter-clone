//
//  UploadTweetViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 21/02/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    func uploadTweet(caption: String){
        
        guard let user = AuthViewModel.shared.user else {return}
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data : [String: Any] = ["uid": user.id,
                                    "capion": caption,
                                    "fullname": user.fullname,
                                    "timestamp": Timestamp(date: Date()),
                                    "username": user.username,
                                    "profileImageUrl": user.profileImageUrl,
                                    "likes":0, "id": docRef.documentID]
        
        docRef.setData(data) { (_) in
            print("Successfully uploaded tweet")
        }
    }
}
