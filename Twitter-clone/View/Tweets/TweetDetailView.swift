//
//  TweetDetailView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 22/02/21.
//

import SwiftUI

struct TweetDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack{
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 55, height: 56)
                    .cornerRadius(28)
                VStack(alignment:.leading, spacing: 4){
                    Text("Bruce Wayne")
                        .font(.system(size: 14,weight:.semibold))
                    Text("@batman")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Text("This is a little space where a have oportunity to weite some words in Enflish")
                .font(.system(size: 22))
            
            Text("7::22 PM")
        }
    }
}

struct TweetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetailView()
    }
}
