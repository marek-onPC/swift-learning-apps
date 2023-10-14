//
//  dataTypes.swift
//  weather-app
//
//  Created by Marek on 2023/10/14.
//

import Foundation

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
