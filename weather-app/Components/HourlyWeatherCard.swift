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
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
    
        return dateFormatter.string(from: dateObject)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(formattedDate(timestamp: timestamp))
                .font(.system(size: 18, weight: .medium))
            HStack {
                Text(description.uppercased())
                    .font(.system(size: 14, weight: .medium))
                    .padding(.horizontal, 10)
                Spacer()
                Text("\(tempValue, specifier: "%.2f")°")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 10)
            }
        }
        // maxWidth: .infinity to fill all aviable space
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(5)
        .padding(8)
    }
}
