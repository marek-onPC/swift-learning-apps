//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

protocol WeatherType {
    var day: String { get }
    var icon: String { get }
    var temp: Int { get }
}

struct Weather: Identifiable, WeatherType {
    var id = UUID()
    var day: String
    var icon: String
    var temp: Int
}

struct ContentView: View {
    @State var isDay: Bool = true
    var weatherData: Array<Weather> = [
        Weather(day: "Monday", icon: "cloud.sun.fill", temp: 26),
        Weather(day: "Tuesday", icon: "sun.max.fill", temp: 32),
        Weather(day: "Wednesday", icon: "sun.max.fill", temp: 30),
        Weather(day: "Thursday", icon: "cloud.sun.fill", temp: 27),
        Weather(day: "Friday", icon: "sun.max.fill", temp: 30),
        Weather(day: "Saturday", icon: "cloud.drizzle.fill", temp: 33),
        Weather(day: "Sunday", icon: "cloud.sun.fill", temp: 29),
    ]
    
    func setIsDay() -> Void {
        self.isDay = !self.isDay
    }
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColorLight: Color("lightBlue"), bottomColorDark: .black, isLight: isDay)
            
            VStack {
                CityNameView(cityName: "Tokyo, JP")
                MainIcon(icon: weatherData.first?.icon, tempValue: weatherData.first?.temp)
                BottomWeatherBarView(data: weatherData)
                BackgroundChangeButton(buttonLabel: "Change background", callback: setIsDay)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
