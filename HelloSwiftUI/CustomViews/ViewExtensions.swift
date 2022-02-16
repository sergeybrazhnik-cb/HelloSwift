//
//  ViewExtensions.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 09.02.2022.
//

import Foundation
import SwiftUI

extension View {
    func roundCorners(radius: Double, corners: UIRectCorner) -> some View {
        clipShape(RoundShape(cornerRadius: radius, corners: corners))
    }
}

struct RoundShape : Shape {
    var cornerRadius: Double
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

