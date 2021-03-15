//
//  ChatViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 14/03/21.
//

import SwiftUI
import Firebase


struct ChatViewModel {
    let user: User
    
    init(user:User){
        self.user = user
    }
    
    
    func fectMessages(){
        
    }
    
    func sendMessage(_ messageText: String){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-message")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-message")
        let messageID = currentUserRef.documentID
        
        let data : [String:Any] = ["text": messageText,
                    "id": messageID,
                    "fromId": currentUid,
                    "told": user.id, "timestamp": Timestamp(date: Date())
                    ]
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id)
        
    }
}
