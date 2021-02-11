//
//  UserProfileView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter : TweetFilterOption = .tweets
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView()
                    .padding()
                //FilterButtonView()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<9){ tweet in
                    TweetCell().padding(20)
                }
            }
            .navigationTitle("Batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
