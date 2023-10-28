//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct HourlyView: View {
    @Binding var cityName: String
    @Binding var currentWeather: Weather?
    @Binding var hourlyWeather: ThreeHourWeather?
    @State private var isDarkMode: Bool = true
    
    func setIsDay() -> Void {
        isDarkMode.toggle()
    }
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color("lightBlue"),
                           bottomColorLight: .blue,
                           bottomColorDark: .black,
                           isLight: isDarkMode)
            
            VStack {
                if (hourlyWeather == nil) {
                    EmptyCityPlaceholder()
                } else {
                    if let hourlyWeatherList = hourlyWeather?.list {
                        ForEach(hourlyWeatherList) { weatherEntry in
                                HourlyWeatherCard(timestamp: weatherEntry.dt,
                                                  description: weatherEntry.weather[0].description,
                                                  tempValue: weatherEntry.main.temp)
                        }
                    }
                }
                Spacer()
                WeatherSearchBar(cityName: $cityName, currentWeather: $currentWeather, hourlyWeather: $hourlyWeather)
            }
        }
    }
}
