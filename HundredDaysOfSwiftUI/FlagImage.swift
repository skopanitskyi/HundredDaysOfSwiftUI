//
//  FlagImage.swift
//  HundredDaysOfSwiftUI
//
//  Created by Сергей Копаницкий on 09.05.2021.
//

import SwiftUI

struct FlagImage: View {
    
    let name: String
    let overlayLineWidth: CGFloat
    let shadowRadius: CGFloat
    
    var body: some View {
        Image(name)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: overlayLineWidth))
            .shadow(color: .black, radius: shadowRadius)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "UK", overlayLineWidth: 2.5, shadowRadius: 10)
    }
}
