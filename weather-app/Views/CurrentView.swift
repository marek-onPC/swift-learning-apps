//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct CurrentView: View {
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
                if (currentWeather == nil) {
                    EmptyCityPlaceholder()
                } else {
                    WeatherCard(cityName: currentWeather?.name ?? "",
                                type: currentWeather?.weather[0].main ?? "",
                                tempValue: currentWeather?.main.temp ?? 0.0)
                }
                Spacer()
                WeatherSearchBar(cityName: $cityName, currentWeather: $currentWeather, hourlyWeather: $hourlyWeather)
            }
        }
    }
}
