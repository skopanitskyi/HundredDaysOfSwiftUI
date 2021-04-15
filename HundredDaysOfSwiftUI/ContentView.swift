//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

private enum ConversionType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case temperature
    case length
    case time
    case volume
}

struct ContentView: View {
    
    @State private var conversionType: ConversionType = .time
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type", selection: $conversionType) {
                        ForEach(ConversionType.allCases, id: \.id) {
                            Text("\($0.rawValue)")
                                .tag($0)
                        }
                    }
                }
                // Measurement
                Section {
                    switch conversionType {
                    case .time:
                        Text("Time")
                    case .temperature:
                        Text("Temperature")
                    case .length:
                        Text("Length")
                    case .volume:
                        Text("Volume")
                    }
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
