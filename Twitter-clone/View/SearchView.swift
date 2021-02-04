//
//  SearchView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 03/02/21.
//

import SwiftUI

struct SearchView: View {
    @State var serachText = ""
    
    var body: some View {
        ScrollView{
            SearchBar(text: $serachText)
                .padding()
            VStack{
                ForEach(0..<19) { _ in
                    Text("AF")
                }
            }
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
