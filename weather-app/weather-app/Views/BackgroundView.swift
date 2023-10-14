//
//  BackgroundView.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct BackgroundView: View {
    var topColor: Color
    var bottomColorLight: Color
    var bottomColorDark: Color
    var isLight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, isLight ? bottomColorLight : bottomColorDark]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}
