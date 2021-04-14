//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orderPrice: String = ""
    @State private var numberOfPeople = ""
    @State private var tipCountIndex = 2
    
    private let tipPercents = [10, 15, 20, 25, 0]
    
    private var amount: Double {
        let price = Double(orderPrice) ?? 0
        let percentOfTips = Double(tipPercents[tipCountIndex])
        let tips = price / 100 * percentOfTips
        return tips + price
    }
    
    private var amountPerPerson: Double {
        let people = Double(numberOfPeople) ?? 0
        return amount / people
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $orderPrice)
                        .keyboardType(.numberPad)
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to live?")) {
                    Picker("", selection: $tipCountIndex) {
                        ForEach(0..<tipPercents.count) {
                            Text("\(tipPercents[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .textCase(.none)
                
                Section(header: Text("Total amount")) {
                    Text("$\(String(format: "%.2f", amount))")
                }
                .textCase(.none)
                
                Section(header: Text("Amount per person")) {
                    Text("$\(String(format: "%.2f", amountPerPerson))")
                }
                .textCase(.none)
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
