//
//  LoginView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 13/02/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        ZStack {
            VStack{
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                
                VStack{
                    CustomTextField(text: $email, placeholder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                     
                }
                
                
                Spacer()
            }
        }.background(Color(#colorLiteral(red: 0.1076790616, green: 0.6322241426, blue: 0.9511476159, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
