//
//  WeatherDayCard.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct WeatherDayCard: View {
    var day: String
    var icon: String
    var temp: Int

    var body: some View {
        VStack(spacing: 8) {
            Text(day.uppercased().prefix(3))
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
