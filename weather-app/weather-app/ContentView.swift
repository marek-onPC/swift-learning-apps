//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = true
    @State private var cityName: String?
    
    // Optional because data will be filled after success call
    @State var currentWeather: Weather?

    
    func setIsDay() -> Void {
        isDarkMode.toggle()
    }
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColorLight: Color("lightBlue"), bottomColorDark: .black, isLight: isDarkMode)
            
            VStack {
                CityNameLabel(cityName: cityName ?? "")
                MainIcon(icon: "cloud.sun.fill", tempValue: currentWeather?.main.temp ?? 0.0)
                BackgroundChangeButton(buttonLabel: "Change to dark mode", callback: setIsDay)
            }
        }
        .task {
            do {
                currentWeather = try await getCurrentWeather()
            } catch {
                print("Error when loading in UI")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
