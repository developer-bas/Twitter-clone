//
//  NewTweetView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 10/02/21.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isPressented: Bool
    @State var captionText: String = ""
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top){
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    TextArea("What's happening", text: $captionText)
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    isPressented.toggle()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }), trailing: Button(action: {}, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
            }))
                Spacer()
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPressented: .constant(true))
    }
}
