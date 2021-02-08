//
//  ChatBubble.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 07/02/21.
//

import SwiftUI

struct ChatBubble: Shape {
    
    var isFromCurrenUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight, isFromCurrenUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
    
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrenUser: false)
    }
}
