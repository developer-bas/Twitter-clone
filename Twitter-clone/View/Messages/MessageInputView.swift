//
//  MessageInputView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 07/02/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText: String
    var action : () -> Void
    
    var body: some View {
        HStack{
            TextField("message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action, label: {
                Text("Send")
            })
        }
    }
}

