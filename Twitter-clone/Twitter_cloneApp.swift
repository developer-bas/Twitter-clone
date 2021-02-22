//
//  Twitter_cloneApp.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 01/02/21.
//

import SwiftUI
import Firebase

@main
struct Twitter_cloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
