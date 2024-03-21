//
//  Alerts.swift
//  TicTacToe
//
//  Created by Fatih Eren Ozcelik on 21.03.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(
        title: Text("You win!"),
        message: Text("You beat your own AI"),
        buttonTitle: Text("Hell yeaah!")
    )
    
    static let computerWin = AlertItem(
        title: Text("You lost!"),
        message: Text("It seems your AI started to beat your ass"),
        buttonTitle: Text("Hell no!")
    )
    
    static let draw = AlertItem(
        title: Text("Draw!"),
        message: Text("You created this AI, come on!?"),
        buttonTitle: Text("Just hell!")
    )
}
