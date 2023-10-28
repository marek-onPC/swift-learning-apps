//
//  dataTypes.swift
//  weather-app
//
//  Created by Marek on 2023/10/14.
//

import Foundation

// Current Weather Data

// Weather response type
struct weather: Codable {
    let id: Int
    let main: String
    let description: String
}

struct main: Codable {
    let temp: Double
    // response key is in snake_case, but in Swift we use camelCase
    // so we will need to use decoder with property ".convertFromSnakeCase"
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let weather: Array<weather>
    let main: main
    let name: String
    let dt: Int
}


// Week Weather Data
struct CityData: Codable {
    let name: String
    let country: String
}


// type corresponding to API response (single entry of an array from response)
struct ThreeHourWeatherEntry: Codable {
    let weather: Array<weather>
    let main: main
    let dt: Int
}

// extension with UUID so array could be looped inside code
// need to be done by extension because API response type (in time of decoding) needs to be axactly like API response
extension ThreeHourWeatherEntry: Identifiable {
    var id: UUID { return UUID() }
}


// type corresponding to API response (with array in reponse)
struct ThreeHourWeather: Codable {
    let city: CityData
    let list: Array<ThreeHourWeatherEntry>
}
