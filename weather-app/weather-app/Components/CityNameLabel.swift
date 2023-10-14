//
//  CityNameView.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct CityNameLabel: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
