//
//  TweetActionViewModel.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 23/02/21.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    let tweet : Tweet
    @Published var didLike = false
    
    init(tweet : Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }

    
    func likeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let tweetRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1 ]){ _ in
            tweetRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.tweet.id).setData([:]) { _ in
                    self.didLike = true
                    print("Le estas dando like")
                }
            }
        }
        
       
    }
    
    func unlikeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let tweetRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1 ]){ _ in
            tweetRef.document(uid).delete { _ in
                
                userLikesRef.document(self.tweet.id).delete { _ in
                    self.didLike = false
                    
                    print("Dislike")
                }
            }
        }
        
        
    }
    
    func checkIfUserLikedTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id).getDocument { (snapshot, _) in
            guard let didLike = snapshot?.exists else {return}
            self.didLike = didLike
        }
        
    }
    
}
