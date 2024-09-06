//
//  PlayerSelectScreenView.swift
//  EngineYard
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI


struct TMPPlayer: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
    var isSelected: Bool = false
    var isAI: Bool = false
}

struct PlayerSelectScreenView: View {
    @State private var players = [
        TMPPlayer(name: "Joe", avatar: "face01"),
        TMPPlayer(name: "Alex", avatar: "face02"),
        TMPPlayer(name: "Sarah", avatar: "face03"),
        TMPPlayer(name: "Emma", avatar: "face04"),
        TMPPlayer(name: "Mike", avatar: "face05")
    ]
    
    var selectedPlayersCount: Int {
        players.filter { $0.isSelected }.count
    }
    
    var body: some View {
        VStack {
            Text("Select Players")
                .font(.largeTitle)
                .padding()
            
            ScrollView {
                ForEach($players) { $player in
                    PlayerRow(player: $player)
                }
            }
            
            Button(action: {
                print("Ready button pressed")
                // Add your game start logic here
            }) {
                Text("Ready")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedPlayersCount >= 3 ? Color.green : Color.gray)
                    .cornerRadius(10)
            }
            .disabled(selectedPlayersCount < 3)
            .padding()
        }
    }
}

struct PlayerRow: View {
    @Binding var player: TMPPlayer
    
    var body: some View {
        HStack {
            Image(player.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                            
            Text(player.name)
                .font(.title3)
            
            Spacer()
            
            /*Toggle("", isOn: $player.isSelected)
            
            if player.isSelected {
                Toggle("AI", isOn: $player.isAI)
            }*/
        }
        .padding()
    }
}


#Preview {
    PlayerSelectScreenView()
}
