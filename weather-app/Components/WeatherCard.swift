//
//  MainIcon.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct WeatherCard: View {
    var cityName: String
    var type: String
    var tempValue: Double
    let weatherIconDict = ["": "sun.max.fill",
                           "sun": "sun.max.fill",
                           "clear": "sun.max.fill",
                           "rain": "cloud.rain.fill",
                           "snow": "cloud.snow.fill",
                           "clouds": "cloud.fill"]
    
    var body: some View {
        VStack(spacing: 8) {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            if let icon = weatherIconDict[type.lowercased()] {
                Image(systemName: icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            }
            // "specifier" used to round to two decimal places
            Text("\(tempValue, specifier: "%.2f")°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        Spacer()
    }
}
