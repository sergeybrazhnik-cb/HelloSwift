//
//  OrangeButton.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 08.02.2022.
//

import Foundation
import SwiftUI

struct FilledButton: View {
    var name: String
    var cornerRadius: Double
    var corners: UIRectCorner
    var color: Color
    var action: ()->()
    
    var body: some View {
        Button(name) {
            action()
        }
        .frame(maxWidth: .infinity, idealHeight: 58, maxHeight: 58)
        .foregroundColor(Color.white)
        .font(Font.custom("Nunito Sans", size: 18.0).weight(.bold))
        .background(color)
        .clipShape(RoundShape(cornerRadius: cornerRadius, corners: corners))
    }
    
    
    init(name: String = "", cornerRadius: Double = 20, corners: UIRectCorner = [.topLeft, .bottomRight], color: Color = Color("Orange"), action: @escaping ()->() ) {
        self.name = name
        self.cornerRadius = cornerRadius
        self.corners = corners
        self.action = action
        self.color = color
    }
}


struct CustomButton_Preview: PreviewProvider {
    static var previews: some View {
        FilledButton(name: "Ik ga akkoord", cornerRadius: 20, corners: [.topLeft, .bottomRight]) {
            
        }
    }
}
