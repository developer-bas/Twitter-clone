//
//  CustomSecureField.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 15/02/21.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeholder.foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16){
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("",text: $text)
                
            }
            
            
        }
    }
}
