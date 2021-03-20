//
//  TweetDetailView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 22/02/21.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    let tweet : Tweet
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack{
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 55, height: 56)
                    .cornerRadius(28)
                VStack(alignment:.leading, spacing: 4){
                    Text(tweet.fullname)
                        .font(.system(size: 14,weight:.semibold))
                    Text("@\(tweet.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text(tweet.detailedTimestampString)
                .foregroundColor(.gray)
                .font(.system(size: 14))
            
            Divider()
            
            HStack(spacing: 12) {
                HStack(spacing: 4){
                    Text("0")
                        .font(.system(size: 14, weight:.semibold))
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                HStack(spacing: 4){
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight:.semibold))
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Divider()
            TweetActionView(tweet: tweet)
            Spacer()
        }
        .padding()
    }
}

