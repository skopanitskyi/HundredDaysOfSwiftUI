//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orderPrice: String = ""
    @State private var numberOfPeople = 2
    @State private var tipCountIndex = 2
    
    private let tipPercents = [10, 15, 20, 25, 0]
    
    private var calculatedPrace: Double {
        let percentOfTips = tipPercents[tipCountIndex]
        let people = Double(numberOfPeople + 2)
        let price = Double(orderPrice) ?? 0
        let tips = price / 100 * Double(percentOfTips)
        let amountPerPerson = (tips + price) / people
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $orderPrice)
                        .keyboardType(.numberPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(numberOfPeople..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to live?")) {
                    Picker("", selection: $tipCountIndex) {
                        ForEach(0..<tipPercents.count) {
                            Text("\(tipPercents[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(String(format: "%.2f", calculatedPrace))")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
