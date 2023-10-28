//
//  DayOfWeekWeatherCard.swift
//  weather-app
//
//  Created by Marek on 2023/10/22.
//

import SwiftUI

struct HourlyWeatherCard: View {
    var timestamp: Int
    var description: String
    var tempValue: Double
    
    func formattedDate(timestamp: Int) -> String {
        let dateFormatter = DateFormatter()
        let dateObject = Date(timeIntervalSince1970: TimeInterval(timestamp))
        dateFormatter.dateFormat = "MM/dd/yyyy"
    
        return dateFormatter.string(from: dateObject)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(formattedDate(timestamp: timestamp))
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Text(description.uppercased())
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            Text("\(tempValue, specifier: "%.2f")°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(8)
    }
}
