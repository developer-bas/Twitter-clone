//
//  Message.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 07/02/21.
//

import Foundation
import Firebase

struct Message : Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId : String
    let isFromCurrentUser : Bool
    let timestamp : Timestamp
    let id: String
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
    
    init(user: User,dictionary: [String: Any ]){
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}


struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hello there", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "General kenoni", isCurrentUser: true),
    .init(id: 2, imageName: "spiderman", messageText: "wheres is dark sidius", isCurrentUser: false),
    .init(id: 3, imageName: "batman", messageText: "I wont tell ou", isCurrentUser: true),
    .init(id: 4, imageName: "spiderman", messageText: "lets fight then ", isCurrentUser: false)
    
]

