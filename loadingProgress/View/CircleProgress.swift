//
//  CircleProgress.swift
//  loadingProgress
//
//  Created by Philippe MICHEL on 24/04/2024.
//

import SwiftUI

struct CircleProgress: View {
    @Binding var reverseForCircle:Bool
    @State var width: CGFloat =  300
    @State var height:CGFloat = 300
    @State var progressCover:Double = 0
    @State var timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.gray.opacity(0.20)),lineWidth: 20)
                .shadow(color: .black.opacity(0.1),radius: 10, x: 10, y: 10)
                .frame(width: width, height: height)
                
            Circle()
                .trim(from:0.0, to: 1 * progressCover / 100)
                //.stroke(Color(.purple),lineWidth: 20,l)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient:Gradient(colors: [.red,.yellow,.green]),startPoint: .bottomTrailing, endPoint: .topLeading))
                .frame(width: width, height: height)
                .animation(.linear, value :progressCover)
            Text("\(Int(progressCover)) %")
                .frame(width: width,height: height)
                .foregroundColor(.black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            
        }.onReceive(timer, perform: { _ in
            progressCircleAnimation()
        })
        
        
    }
    // animation
    func progressCircleAnimation() {
        if reverseForCircle == false {
            if progressCover < 100 {
                progressCover += 1
            } else {
                // un fonctionnement à l'infinie
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    reverseForCircle = true
//                }
            }
        }
        
        if reverseForCircle == true {
            if progressCover > 0 {
                progressCover -= 1
            } else {
                // un fonctionnement à l'infinie
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                   // reverse = false
//                }
            }
        }
    }
}

#Preview {
    CircleProgress(reverseForCircle:.constant(false))
}
