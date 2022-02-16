//
//  Rainbow.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 15.02.2022.
//
import SwiftUI

struct Rainbow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay( LinearGradient(gradient: Gradient(colors: Color.viduaGradient),
                                     startPoint: .leading,
                                     endPoint: .trailing)
            )
            .mask(content)
    }
}
extension View {
    func rainbow() -> some View {
        self.modifier(Rainbow())
    }
}

struct RainbowAnimation: ViewModifier {
    @State var isOn: Bool = false
    var duration: Double = 4
    var animation: Animation {
        Animation
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
    func body(content: Content) -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: Color.viduaGradient+Color.viduaGradient+Color.viduaGradient+Color.viduaGradient),
                                      startPoint: .leading, endPoint: .trailing)
        return content.overlay(GeometryReader { proxy in
            let offset = proxy.size.width/5/2
            ZStack {
                gradient
                    .frame(width: 4*proxy.size.width)
                    .offset(x: self.isOn ? -2*proxy.size.width-offset : -proxy.size.width-offset/2)
            }
        })
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(self.animation) {
                        self.isOn = true
                    }
                }
        }
        .mask(content)
    }
}
struct MenuRainbowAnimation: ViewModifier {
    @Binding var isOn: Bool
    var duration: Double = 4
    var animation: Animation {
        Animation
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
    func body(content: Content) -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: Color.viduaGradient+Color.viduaGradient+Color.viduaGradient+Color.viduaGradient),
                                      startPoint: .leading, endPoint: .trailing)
        return content.overlay(GeometryReader { proxy in
            let offset = proxy.size.width/5/2
            ZStack {
                gradient
                    .frame(width: 4*proxy.size.width)
                    .offset(x: self.isOn ? -2*proxy.size.width-offset : -proxy.size.width-offset/2)
            }
        })
        .mask(content)
        .animation(animation)
    }
}
extension View {
    func rainbowAnimation() -> some View {
        self.modifier(RainbowAnimation())
    }
}

struct RainbowExamples: View {
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Capsule()
                    .frame(width: 200, height: 4)
                    .rainbow()
                
                Capsule()
                    .frame(width: 200, height: 4)
                    .rainbowAnimation()
                
                Text("Vidua")
                    .font(.system(size: 100))
                    .rainbowAnimation()
            }
        }
    }
}

struct Rainbow_Previews: PreviewProvider {
    static var previews: some View {
        RainbowExamples()
    }
}






extension Color {
    static let globalTitle = Color("GlobalTitle")
    static let globalBackground = Color("GlobalBackground")
    static let globalShadow = Color("GlobalShadow")
    static let globalText = Color("GlobalText")
    static let viduaGradient = [Color("ViduaGradient0"),
                                Color("ViduaGradient1"),
                                Color("ViduaGradient2"),
                                Color("ViduaGradient3"),
                                Color("ViduaGradient4")]
}
