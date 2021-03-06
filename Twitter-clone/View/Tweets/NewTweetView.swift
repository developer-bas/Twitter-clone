//
//  NewTweetView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 10/02/21.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPressented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel : UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPressented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top ){
                    if let user = AuthViewModel.shared.user{
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    TextArea("What's happening", text: $captionText)
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    isPressented.toggle()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }), trailing: Button(action: {
                    viewModel.uploadTweet(caption: captionText)
                }, label: {
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
//
//struct NewTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTweetView(isPressented: .constant(true))
//    }
//}
