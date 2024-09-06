//
//  ContentView.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
        ZStack {
            // Background color
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Game title
                Text("Engine Yard")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                // Play button
                Button(action: {
                    print("Play button clicked")
                }) {
                    Text("Play")
                        .buttonStyle()
                }
                
                // Options button
                Button(action: {
                    print("Options button clicked")
                }) {
                    Text("Options")
                        .buttonStyle()
                }
                
                // Credits button
                Button(action: {
                    print("Credits button clicked")
                }) {
                    Text("Credits")
                        .buttonStyle()
                }
            }
        }
    }
}

// Custom button style
extension Text {
    func buttonStyle() -> some View {
        self.font(.title2)
            .foregroundColor(.black)
            .padding()
            .frame(width: 200)
            .background(Color.white)
            .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
