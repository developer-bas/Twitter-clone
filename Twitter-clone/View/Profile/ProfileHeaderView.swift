//
//  ProfileHeaderView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @State var selectedFilter: TweetFilterOption = .tweets
    let user : User
    var body: some View {
        VStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius( 120 / 2)
                .shadow(color: .black, radius: 6   , x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            Text(user.fullname)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 8)
            Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Billonare by dat, dark knight by night")
                    .padding(.top,8)
                    .font(.system(size: 14))
                
            HStack(spacing: 40){
                VStack{
                    Text("12")
                        .font(.system(size: 16)).bold()
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("0")
                        .font(.system(size: 16)).bold()
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
            
//            FilterButtonView(selectedOption: $selectedFilter)
//                .padding()
            
            Spacer()
            
        }
    }
}

