//
//  UserProfileView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView()
                    .padding()
            }
            .navigationTitle("Batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
