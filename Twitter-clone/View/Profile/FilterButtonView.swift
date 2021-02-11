//
//  FilterButtonView.swift
//  Twitter-clone
//
//  Created by PROGRAMAR on 09/02/21.
//

import SwiftUI


enum TweetFilterOption: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var tittle: String{
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}




struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOption
    private let  underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOption.allCases.count)
    private var padding : CGFloat{
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilterOption.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue ) + 16
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ForEach(TweetFilterOption.allCases, id: \.self){ option in
                    
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.tittle)
                            .frame(width: underlineWidth - 8)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(.leading,padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
