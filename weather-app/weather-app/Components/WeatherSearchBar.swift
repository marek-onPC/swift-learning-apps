//
//  WeatherSearchBar.swift
//  weather-app
//
//  Created by Marek on 2023/10/18.
//

import SwiftUI

struct WeatherSearchBar: View {
    @Binding var cityName: String
    @Binding var currentWeather: Weather?
    @Binding var hourlyWeather: ThreeHourWeather?
    
    var body: some View {
        TextField("City name", text: $cityName)
            .font(.system(size: 26, weight: .light))
            .foregroundColor(.gray)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: 250)
            .padding(.top, 50)
            .padding(.bottom, 10)
        Button {
            Task {
                do {
                    currentWeather = try await getCurrentWeather(cityName: cityName)
                    hourlyWeather = try await getThreeHourWeather(cityName: cityName)
                    print(currentWeather ?? "")
                    print(hourlyWeather ?? "")
                } catch {
                    print("Error when loading by Button")
                }
            }
        } label: {
            Text("Load")
                .font(.system(size: 22, weight: .light))
                .foregroundColor(.gray)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .frame(width: 250)
                .padding(.bottom, 50)
        }
    }
}

