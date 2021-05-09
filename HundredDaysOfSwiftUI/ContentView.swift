//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

enum GameOptions: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct ContentView: View {
    @State private var shouldDisplayResultAlert = false
    @State private var roundsToEnd = 10
    @State private var score = 0
    @State private var currentOption = Int.random(in: 0..<GameOptions.allCases.count)
    @State private var shouldWin = Bool.random()
    
    var body: some View {
        VStack {
            Text("\(roundsToEnd) rounds")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding([.trailing], 5)
            Spacer()
            Text("You are must \(shouldWin ? "Win" : "Lose")")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            Text("Computer selected a \(GameOptions.allCases[currentOption].rawValue)")
                .foregroundColor(.black)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            ForEach(GameOptions.allCases, id: \.id) { option in
                Button(action: {
                    didTapOption(option)
                }, label: {
                    Text(option.rawValue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .background(Color.yellow.opacity(0.8))
                        .foregroundColor(.black)
                        .padding([.leading, .trailing], 30)
                })
            }
            Spacer()
        }
        .backgroundGradient(startPoint: .top,
                            endPoint: .bottom,
                            colors: [.red, .blue])
        .alert(isPresented: $shouldDisplayResultAlert) {
            Alert(title: Text("Your score is \(score)"), dismissButton: .default(Text("New game"), action: {
                newGame()
            }))
        }
    }
    
    private func didTapOption(_ option: GameOptions) {
        switch GameOptions.allCases[currentOption] {
        case .paper:
            if shouldWin {
                score += option == .scissors ? 1 : option == .paper ? 0 : -1
            } else {
                score += option == .rock ? 1 : option == .paper ? 0 : -1
            }
        case .rock:
            if shouldWin {
                score += option == .paper ? 1 : option == .rock ? 0 : -1
            } else {
                score += option == .scissors ? 1 : option == .rock ? 0 : -1
            }
        case .scissors:
            if shouldWin {
                score += option == .rock ? 1 : option == .scissors ? 0 : -1
            } else {
                score += option == .paper ? 1 : option == .scissors ? 0 : -1
            }
        }
        withAnimation {
            nextRound()
        }
    }
    
    private func nextRound() {
        roundsToEnd -= 1
        guard roundsToEnd != .zero else {
            shouldDisplayResultAlert = true
            return
        }
        updateOptions()
    }
    
    private func newGame() {
        withAnimation {
            roundsToEnd = 10
            score = 0
            updateOptions()
        }
    }
    
    private func updateOptions() {
        currentOption = Int.random(in: 0..<GameOptions.allCases.count)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
