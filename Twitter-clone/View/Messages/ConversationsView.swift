//
//  ConversationsView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 04/02/21.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0..<50) {  _ in
                        ConversationCell()
                        
                    }
                }.padding()
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
        }
    
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
