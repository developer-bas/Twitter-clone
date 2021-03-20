//
//  MessageView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 08/02/21.
//

import SwiftUI
import Kingfisher


struct MessageView: View {
    let message : Message
    var body: some View {
        
        HStack{
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrenUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }else{
                HStack(alignment: .bottom){
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height:40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrenUser: false))
                        .foregroundColor(.black)
                    
                    
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
