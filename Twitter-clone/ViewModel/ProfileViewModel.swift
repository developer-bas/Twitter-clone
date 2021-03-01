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
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserisFollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    
    func tweets(forFilter filter: TweetFilterOption)-> [Tweet]{
        switch filter {
        case .tweets: return userTweets
        case .likes : return likedTweets
        
        }
    }
}

extension ProfileViewModel {
    func follow(){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]){ _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]){_ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow(){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followerRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { (_) in
            followerRef.document(currentUid).delete { (_) in
                self.isFollowed = false
            }
        }
        
    }
    
    
    func checkIfUserisFollowed(){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        followingRef.document(user.id).getDocument { (snapshot, _) in
            
            guard let isFollowed = snapshot?.exists else {return}
            self.isFollowed = isFollowed
    
        }
    }
    
    func fetchUserTweets(){
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
//            documents.forEach { document in
//                print("DEBUG: Doc data is \(document.data())")
//            }
            self.userTweets = documents.map({Tweet(dictionary: $0.data())})
        }
    }
    
    func fetchLikedTweets(){
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            let tweetIDs = documents.map ({ $0.documentID })
            tweetIDs.forEach { (id) in
                COLLECTION_TWEETS.document(id).getDocument { (snapshot, _) in
                    guard let data = snapshot?.data() else {return}
                    let tweet = Tweet(dictionary: data)
                    
                    tweets.append(tweet)
                    
                    guard tweets.count == tweetIDs.count else {return}
                    
                    self.likedTweets.append(tweet)
                }
            }
        }
    }
    
    func fetchUserStats(){
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingsRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-following")
        
        followersRef.getDocuments { (snapshot, _) in
            guard let followersCount = snapshot?.documents.count else {return}
            followingsRef.getDocuments { (snapshot, _) in
                
                guard let followingCount = snapshot?.documents.count else {return }
                let stats = UserStates(followers: followersCount, following: followingCount)
            }
        }
    }
}
