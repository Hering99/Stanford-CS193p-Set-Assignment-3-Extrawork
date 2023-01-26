//
//  ContentView.swift
//  Set.Extrawork
//
//  Created by Lukas Hering on 21.12.22.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: GameOfSet

//View combine cards, layout, content and buttons
    var body: some View {
        NavigationView {
            VStack  {
                HStack {
                    Text("Set!").foregroundColor(.black)
                    Spacer()
                    Button { game.multiPlayerMode() } label: {
                        Text("Coop") }
                } .foregroundColor(.blue).font(.largeTitle).padding(.horizontal)
                    
                HStack {
                    if game.multiplayer == false {
                        Text("Score: \(game.score)")
                            .bold().foregroundColor(.black).padding(.bottom)
                    }
                    else {
                        Text("Score 1: \(game.score1)").bold().padding(.bottom)
                        Spacer()
                        Text("Score 2: \(game.score2)").bold().padding(.bottom)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                
                    
                    if !game.isEndOfGame {
                        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                            CardView(card: card)
                                .padding(5)
                                .onTapGesture {
                                    game.choose(card)
                                }
                        }
                    } else {
                            Text("Game Over").foregroundColor(.green).font(.largeTitle)
                    }
                    
                    HStack {
                        Spacer()
                        Button { game.newGame() } label: { Text("New Game") }
                        Spacer()
                        if !game.isEndOfGame {
                            Button { game.cheat() } label: { Text("Cheat") }
                            Spacer()
                            if game.numberOfPlayedCards < game.totalNumberOfCards {
                                Button { game.dealThreeCards() } label: { Text("Deal 3 Cards") }
                            } else {
                                Text("Deal 3 Cards").foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }
                    .padding(.bottom)
                }
            .padding()
            .foregroundColor(.blue)
            .navigationBarHidden(true)
            }
               
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameOfSet()
        SetGameView(game: game)
    }
}
