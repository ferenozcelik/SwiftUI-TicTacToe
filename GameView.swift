//
//  GameView.swift
//  TicTacToe
//
//  Created by Fatih Eren Ozcelik on 20.03.2024.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var vm = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: vm.columns, spacing: 5) {
                    ForEach(0..<9) {i in
                        ZStack {
                            GameCircleView(proxy: geometry)
                            PlayerIndicator(systemImageName: vm.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            vm.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .disabled(vm.isGameboardDisabled)
            .alert(item: $vm.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { vm.resetGame() })
                )
            }
        }
    }
}

#Preview {
    GameView()
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct GameCircleView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundStyle(.blue).opacity(1)
            .frame(width: proxy.size.width / 3 - 15,
                   height: proxy.size.width / 3 - 15)
    }
}

struct PlayerIndicator: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundStyle(.white)
    }
}
