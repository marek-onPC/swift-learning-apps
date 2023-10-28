//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var cityName: String = ""
    
    // Optional because data will be filled after success call
    @State private var currentWeather: Weather?
    @State private var hourlyWeather: ThreeHourWeather?

    var body: some View {
        TabView {
            Group {
                TodayView(cityName: $cityName,
                          currentWeather: $currentWeather,
                          hourlyWeather: $hourlyWeather)
                    .tabItem {
                        // SF Symbols
                        Image(systemName: "sun.max.fill")
                        // Label text
                        Text("Today")
                    }
                HourlyView(cityName: $cityName,
                         currentWeather: $currentWeather,
                           hourlyWeather: $hourlyWeather)
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Hourly")
                    }
            }
            .toolbarBackground(.blue, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        // To define accent color of the selcted Tab button
        .accentColor(.white)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
