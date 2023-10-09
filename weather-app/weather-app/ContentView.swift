//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var day: String
    var icon: String
    var temp: String
}

struct ContentView: View {
    var weatherData: Array<Weather> = [
        Weather(day: "Monday", icon: "cloud.sun.fill", temp: "26"),
        Weather(day: "Tuesday", icon: "sun.max.fill", temp: "32"),
        Weather(day: "Wednesday", icon: "sun.max.fill", temp: "30"),
        Weather(day: "Thursday", icon: "cloud.sun.fill", temp: "27"),
        Weather(day: "Friday", icon: "sun.max.fill", temp: "30"),
        Weather(day: "Saturday", icon: "cloud.drizzle.fill", temp: "33"),
        Weather(day: "Sunday", icon: "cloud.sun.fill", temp: "29"),
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
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
                    Text("\(weatherData.first?.temp ??  "-")°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(weatherData.dropFirst()) { weatherDay in
                            VStack(spacing: 8) {
                                Text(weatherDay.day.uppercased().prefix(3))
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Image(systemName: weatherDay.icon)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text("\(weatherDay.temp)°")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                        }
                    }
                }
                .padding()
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
