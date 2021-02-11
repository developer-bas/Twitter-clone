//
//  FeedView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 02/02/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweerView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0..<100) {  _ in
                        TweetCell()
                    }
                }.padding()
            }
            
            Button(action: {
                isShowingNewTweerView.toggle()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweerView) {
                NewTweetView(isPressented: $isShowingNewTweerView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
