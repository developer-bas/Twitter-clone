//
//  ImagePicker.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 15/02/21.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
  
    
}


extension ImagePicker{
    class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        }

    }
    

    
}
