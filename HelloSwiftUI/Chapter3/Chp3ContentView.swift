//
//  Chp3ContentView.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 14.02.2022.
//

import SwiftUI

struct Chp3ContentView : View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.33)
            
            Text("Hello bro!")
                .frame(width: 100, height: 100, alignment:.center)
                .background(Color.black.opacity(0.33))
                .northEastShadow()
        }.ignoresSafeArea()
        
        
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        Chp3ContentView()
    }
}
