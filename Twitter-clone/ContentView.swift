//
//  ContentView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 01/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                Text("1")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                Text("2")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                Text("3")
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Message")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
