//
//  ContentView.swift
//  loadingProgress
//
//  Created by Philippe MICHEL on 24/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var reverseForBar:Bool = true
    @State var reverseForCircle:Bool = true
    var body: some View {
        VStack {
            BarProgress(reverseForBar: $reverseForBar)
                .padding(.top,30)
                .onTapGesture {
                    self.reverseForBar.toggle()
                }
            Spacer()
            Text(LocalizedStringKey(stringLiteral: "title"))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .italic()
                .padding(.top,10)
            Spacer()
            CircleProgress(reverseForCircle: $reverseForCircle)
                .padding(.bottom,30)
                .onTapGesture {
                    self.reverseForCircle.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
