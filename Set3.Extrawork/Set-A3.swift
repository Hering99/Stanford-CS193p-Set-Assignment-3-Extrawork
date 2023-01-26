//
//  Set_ExtraworkApp.swift
//  Set.Extrawork
//
//  Created by Lukas Hering on 21.12.22.
//

import SwiftUI

@main
struct SetApp: App {
    let game = GameOfSet()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}

