//
//  BackgroundGradientView.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 09.05.2021.
//

import SwiftUI

struct BackgroundGradientView: ViewModifier {
    
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let colors: [Color]
    
    func body(content: Content) -> some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: startPoint,
                           endPoint: endPoint)
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    func backgroundGradient(startPoint: UnitPoint, endPoint: UnitPoint, colors: [Color]) -> some View {
        modifier(BackgroundGradientView(startPoint: startPoint, endPoint: endPoint, colors: colors))
    }
}
