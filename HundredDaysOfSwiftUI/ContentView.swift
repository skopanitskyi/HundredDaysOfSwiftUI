//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany",
                                    "Ireland", "Italy", "Nigeria",
                                    "Poland", "Russia", "Spain",
                                    "UK", "US"].shuffled()
    @State private var answerIndex = Int.random(in: 0...2)
    @State private var isDisplayScore = false
    @State private var title = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(countries[answerIndex])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Group {
                    ForEach(0..<3) { index in
                        Button(action: {
                            didTapFlag(with: index)
                        }, label: {
                            Image(countries[index])
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1.0))
                                .shadow(color: .black, radius: 10)
                        })
                        .padding()
                    }
                }
            }
        }
        .alert(isPresented: $isDisplayScore) {
            Alert(title: Text(title),
                  message: Text("Your score is"),
                  dismissButton: .default(Text("Continue"), action: {
                    shuffleCountries()
                  }))
        }
    }
    
    private func didTapFlag(with index: Int) {
        title = index == answerIndex ? "Correct" : "Wrong"
        isDisplayScore.toggle()
    }
    
    private func shuffleCountries() {
        countries.shuffle()
        answerIndex = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
