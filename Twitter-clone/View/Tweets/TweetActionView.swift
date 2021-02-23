//
//  TweetActionView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 23/02/21.
//

import SwiftUI

struct TweetActionView: View {
    var body: some View {
        HStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
        }.padding(.horizontal)
        .foregroundColor(.gray)
        
    }
}

struct TweetActionView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionView()
    }
}
