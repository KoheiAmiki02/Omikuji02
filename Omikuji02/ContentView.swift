//
//  ContentView.swift
//  Omikuji02
//
//  Created by cmStudent on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var omikujiViewModel = OmikujiViewModel()
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Image(omikujiViewModel.image)
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                if omikujiViewModel.isStarted {
                    Text("スマホを振って！")
                        .font(.title)
                        .foregroundColor(Color.orange)
                        .frame(height: 100)
                } else {
                    Button {
                        omikujiViewModel.start()
                    } label: {
                        Text("おみくじを引く")
                            .foregroundColor(Color.orange)
                            .font(.title)
                            .frame(width: 300, height: 100, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.orange, lineWidth: 2)
                            )
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
