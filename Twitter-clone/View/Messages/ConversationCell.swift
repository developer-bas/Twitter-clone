//
//  ConversationCell.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 05/02/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12){
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width:56, height: 56)
                    .cornerRadius(28)
                    
                VStack(alignment: .leading,spacing: 4){
                    Text("Venom")
                        .font(.system(size: 14,weight:.semibold))
                    Text("Eddie Brock longer message text t make ui test but i dont ")
                        .font(.system(size: 15))
                        .lineLimit(2)
                    
                }
                .padding(.trailing)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
