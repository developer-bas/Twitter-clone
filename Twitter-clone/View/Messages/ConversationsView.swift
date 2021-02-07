//
//  ConversationsView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 04/02/21.
//

import SwiftUI

struct ConversationsView: View {
    
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0..<50) {  _ in
                        NavigationLink(
                            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                            label: {
                                ConversationCell()
                            })
                    }
                }.padding()
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }, label: {
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
            .sheet(isPresented: $isShowingNewMessageView, content: {
                SearchView()
            })
        }
    
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
