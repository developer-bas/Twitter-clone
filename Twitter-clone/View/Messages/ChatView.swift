//
//  ChatView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 07/02/21.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0..<15){ _ in
                        HStack{
                            Spacer()
                            Text("test message text")
                                .padding()
                                .background(Color.blue)
                                .clipShape(ChatBubble(isFromCurrenUser: true))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
