//
//  BarProgress.swift
//  loadingProgress
//
//  Created by Philippe MICHEL on 24/04/2024.
//

import Foundation
import SwiftUI

struct BarProgress:View {
    @Binding var reverseForBar:Bool
    @State var width: CGFloat =  300
    @State var height:CGFloat = 45
    
    @State var progressCover:Double = 0
    // modifier la durée (every:0.02)
    @State var timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .stroke(Color(.gray.opacity(20)),lineWidth: 1)
                    .shadow(color: .black.opacity(70),radius: 10, x: 10, y: 10)
                    .cornerRadius(10)
                    .frame(width: width, height: height)
                    .shadow(color: .black.opacity(0.1),radius: 10, x: 10, y: 10)
                Rectangle()
                    .foregroundStyle(LinearGradient(gradient:Gradient(colors: [.red,.yellow,.green]),startPoint: .leading, endPoint: .trailing))
                    .frame(width: width * progressCover / 100, height: height)
                    .animation(.linear, value :progressCover)
                    .cornerRadius(10)
                Text("\(Int(progressCover)) %")
                    .frame(width: width,height: height)
                    .foregroundColor(.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
            }.onReceive(timer, perform: { _ in
                progressBarAnimation()
            })
            
            
        }
        
    }
    // animation pour barre 
    func progressBarAnimation() {
        if reverseForBar == false {
            if progressCover < 100 {
                progressCover += 1
            } else {
             // pour un fonctionnement à l'infinie sans clic
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    reverseForBar = true
//                }
                
            }
        }
        
        if reverseForBar == true {
            if progressCover > 0 {
                progressCover -= 1
            } else {
                // pour un fonctionnement à l'infinie sans clic
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    //reverse = false
//                    
//                }
            }
        }
        
    }
}

#Preview {
    BarProgress(reverseForBar: .constant(false))
}

