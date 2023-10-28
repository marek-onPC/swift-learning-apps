//
//  BottomWeatherBarView.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct BottomWeatherBarView: View {
    var data: Array<Weather>

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 25) {
//                ForEach(data.dropFirst()) { weatherDay in
//                    WeatherDayCard(day: weatherDay.day,
//                                  icon: weatherDay.icon,
//                                  temp: weatherDay.temp)
//                }
            }
        }
        .padding()
        Spacer()
    }
}
