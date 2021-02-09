//
//  MessageView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 08/02/21.
//

import SwiftUI


struct MessageView: View {
    let message : MockMessage
    var body: some View {
        
        HStack{
            if message.isCurrentUser {
                Spacer()
                Text(message.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrenUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }else{
                HStack(alignment: .bottom){
                    Image(message.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height:40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(message.messageText)
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
