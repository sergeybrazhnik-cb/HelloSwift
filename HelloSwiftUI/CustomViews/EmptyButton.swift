//
//  WhiteButton.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 09.02.2022.
//

import Foundation
import SwiftUI

struct EmptyButton: View {
    
    var name: String
    var cornerRadius: Double
    var corners: UIRectCorner
    var action: ()->()
    var color: Color
    var leftImageName: String?
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack{
                if let leftImageName = leftImageName {
                    Image(systemName: leftImageName).foregroundColor(color)
                }
                Text(name)
            }
            
        }
        .background(Color.white)
        .frame(maxWidth: .infinity, idealHeight: 58, maxHeight: 58)
        .foregroundColor(color)
        .font(Font.custom("Nunito Sans", size: 18.0).weight(.bold))
        .overlay(
            RoundShape(cornerRadius: cornerRadius, corners: corners)
                        .stroke(color, lineWidth: 2)
                )
    }
    
    
    init(name: String = "", cornerRadius: Double = 20, corners: UIRectCorner = [.topLeft, .bottomRight], color: Color = Color("Orange"), leftImageName: String? = nil, action: @escaping ()->() ) {
        self.name = name
        self.cornerRadius = cornerRadius
        self.corners = corners
        self.action = action
        self.color = color
        self.leftImageName = leftImageName
    }
}


struct White_Preview: PreviewProvider {
    static var previews: some View {
        EmptyButton(name: "Hello btn") {
            ""
        }
        
        
        // uncomment to see example
//        VStack{
//            EmptyButton(name: "Hello button", corners: [.bottomRight]) {
//
//            }
//
//            EmptyButton(name: "Hello button", color: Color("Blue"), leftImageName: "arrow.counterclockwise") {
//
//            }
//        }
    }
}
