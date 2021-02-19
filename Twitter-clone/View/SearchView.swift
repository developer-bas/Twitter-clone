//
//  SearchView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 03/02/21.
//

import SwiftUI

struct SearchView: View {
    @State var serachText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $serachText)
                .padding()
            VStack(alignment: .leading){
                ForEach(viewModel.users) { user in
                    HStack{Spacer()}
                    
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell(user: user)
                        }
                    )
                }
            }.padding(.leading)
        }
        .navigationBarTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
