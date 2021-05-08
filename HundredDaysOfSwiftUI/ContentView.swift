//
//  ContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .header(text: "Swift 5", color: .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func header(text: String, color: Color) -> some View {
        modifier(HeaderView(text: text, color: color))
    }
}

struct HeaderView: ViewModifier {
    
    let text: String
    let color: Color
    
    func body(content: Content) -> some View {
        VStack {
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(color)
            Spacer()
            content
            Spacer()
        }
    }
}
