//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

struct Length: Hashable, Identifiable {
    public let id = UUID()
    public let unit: UnitLength
    public let name: String
}

struct ContentView: View {
    
    @State private var fromLengthType = 0
    @State private var toLengthType = 0
    @State private var value = ""
    
    private var dataSource: [Length] {
        return getLengthUnits()
    }
    
    private func getLengthUnits() -> [Length] {
        return [Length(unit: .meters, name: "Meters"),
                Length(unit: .kilometers, name: "Kilometers"),
                Length(unit: .feet, name: "Feet"),
                Length(unit: .yards, name: "Yards"),
                Length(unit: .miles, name: "Miles")]
    }
    
    private var result: Double? {
        guard dataSource.indices.contains(fromLengthType),
              dataSource.indices.contains(toLengthType),
              let value = Double(value)
        else { return nil }
        let fromUnit = dataSource[fromLengthType].unit
        let toUnit = dataSource[toLengthType].unit
        return Measurement<UnitLength>(value: value, unit: fromUnit).converted(to: toUnit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("", selection: $fromLengthType) {
                        ForEach(0..<dataSource.count) { index in
                            HStack {
                                Text(dataSource[index].name)
                                Spacer()
                            }
                        }
                    }
                }
                
                Section {
                    TextField("Enter value", text: $value)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Picker("", selection: $toLengthType) {
                        ForEach(0..<dataSource.count) { index in
                            HStack {
                                Text(dataSource[index].name)
                                Spacer()
                            }
                        }
                    }
                }
                
                Section {
                    Text(String(format: "%.2f", result ?? 0))
                }
            }
            .navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
