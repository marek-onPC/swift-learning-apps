//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct TodayView: View {
    @State private var isDarkMode: Bool = true
    @State private var cityName: String = ""
    
    // Optional because data will be filled after success call
    @State var currentWeather: Weather?

    
    func setIsDay() -> Void {
        isDarkMode.toggle()
    }
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue,
                           bottomColorLight: Color("lightBlue"),
                           bottomColorDark: .black,
                           isLight: isDarkMode)
            
            VStack {
                if (currentWeather == nil) {
                    EmptyCityPlaceholder()
                } else {
                    WeatherCard(cityName: currentWeather?.name ?? "",
                                icon: "cloud.sun.fill",
                                tempValue: currentWeather?.main.temp ?? 0.0)
                }
                Spacer()
                WeatherSearchBar(cityName: $cityName, currentWeather: $currentWeather)
            }
        }
    }
}
