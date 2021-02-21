//
//  ProfileActionButtonView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI

struct ProfileActionButtonView: View {

    let viewModel: ProfileViewModel
    @Binding var  isFollowed : Bool
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(20)

        }else{
            HStack{
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following": "Follow")
                        .frame(width: 140, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
                
                Button(action: {
                    print("haz algo")
                }, label: {
                    Text("Message")
                        .frame(width: 140, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(20)


            }
        }
    }
}
