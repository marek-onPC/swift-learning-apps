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
            LinearGradient(gradient: Gradient(colors: [.blue, isDay ? Color("lightBlue") : .black]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tokyo, JP")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: weatherData.first?.icon ?? "exclamationmark.square")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("\(weatherData.first?.temp ??  0)°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        ForEach(weatherData.dropFirst()) { weatherDay in
                            ExtractedView(day: weatherDay.day,
                                          icon: weatherDay.icon,
                                          temp: weatherDay.temp)
                        }
                    }
                }
                .padding()
                Spacer()
                Button {
                    setIsDay()
                } label: {
                    Text("Change background")
                        .padding(16)
                }
                    .foregroundColor(.blue)
                    .background(.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .cornerRadius(5)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View, WeatherType {
    var day: String
    var icon: String
    var temp: Int

    var body: some View {
        VStack(spacing: 8) {
            Text(day.uppercased().prefix(3))
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
