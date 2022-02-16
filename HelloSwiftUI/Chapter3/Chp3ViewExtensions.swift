//
//  ViewExtensions.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 14.02.2022.
//

import SwiftUI

extension View {
    func northEastShadow(radius: CGFloat = 16.0, offset: CGFloat = 6) -> some View {
        self
            .shadow(color: Color.white, radius: radius, x: -offset, y: -offset)
            .shadow(color: Color.black.opacity(0.66), radius: radius, x: offset, y: offset)
    }
}
