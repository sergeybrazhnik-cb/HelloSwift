//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Sergey Brazhnik on 22.04.2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var vm : ViewModel = ViewModel()
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 16, content: {
            HStack(alignment: .center, spacing: 0, content: {
                Text("eID App emulator").font(.title).padding()
            }).rainbow()
            
            FilledButton(name: "Ik ga akkoord") {
                
            }
            
            EmptyButton(name: "Hello button") {
                
            }
            
            Text("Next one")
            
            VStack {
                ZStack{
                    Color.black.opacity(0.33)
                }
                .frame(width: 100, height: 100, alignment: .center)
                .northEastShadow()
                
                FilledButton(name: "Im the first", corners: [.topLeft]) {
                
                }
                
                FilledButton(name: "Im the first", color: Color("Red")) {
                
                }
                
                EmptyButton(name: "Hello button", corners: [.bottomRight]) {
                    
                }
                
                EmptyButton(name: "Hello button", color: Color("Blue"), leftImageName: "arrow.counterclockwise") {
                    
                }
            }.padding()
        })
    }
    
    func method(){
        
    }
    
}


extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var randomString : String = randomString(length: 30)
        @Published var touple : Touple = Touple()
        
        
        static func randomString(length: Int) -> String {
          let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<length).map{ _ in letters.randomElement()! })
        }
        
        func buttonAction(){
            self.randomString = ViewModel.randomString(length: 30)
        }
    }
}

struct Touple {
    var intValue : Int = 100
    var stringValue : String = "Hello Bro!"
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

//    #if DEBUG
//    @objc class func injected() {
//        UIApplication.shared.windows.first?.rootViewController =
//                UIHostingController(rootView: ContentView())
//    }
//    #endif
}
