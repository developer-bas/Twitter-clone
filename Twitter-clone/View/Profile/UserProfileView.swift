//
//  UserProfileView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI

struct UserProfileView: View {
    let user : User
    @ObservedObject var viewModel : ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    
    @State var selectedFilter : TweetFilterOption = .tweets
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                //FilterButtonView()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.likedTweets){ tweet in
                    TweetCell(tweet: tweet)
                        .padding()
                }
            }
            .navigationTitle("Batman")
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
