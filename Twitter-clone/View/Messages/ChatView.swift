//
//  ChatView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 07/02/21.
//

import SwiftUI

struct ChatView: View {
    let user : User
    let viewModel: ChatViewModel

    @State var messageText: String = ""
    
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(MOCK_MESSAGES){ message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
                
        }.navigationTitle(user.username)
    }
    
    
    func sendMessage(){
        viewModel.sendMessage(messageText)
    }
}

