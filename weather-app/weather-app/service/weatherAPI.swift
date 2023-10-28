//
//  File.swift
//  weather-app
//
//  Created by Marek on 2023/10/14.
//

import Foundation

enum NetworkCallError: Error {
    case invalidURL, serviceError, networkError, decodingError
}

func getCurrentWeather(cityName: String) async throws -> Weather {
    let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=75f9685f116b28f3c9b5ad6246d906ae&units=metric"
    
    // URL() return an optional value so in case if string cannot be parsed into URL
    // we should actually stop function from making a call (hence throwing an error)
    guard let url = URL(string: endpoint) else {
        throw NetworkCallError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // Casting response into HTTPURLResponse type to get access to status
    // because response is optional, you can use guard let here
    guard let response = response as? HTTPURLResponse else {
        throw NetworkCallError.networkError
    }
    
    if response.statusCode == 200 {
        // If call is successful, decode JSON data
        do {
            let decoder = JSONDecoder()
            
            // Define what strategy should be use for decoding JSON data
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            // Return decoded fetched data (mapped into WeatherResponse struct)
            // First argument is a <Type>.self, next is from what data you are decoding
            return try decoder.decode(Weather.self, from: data)
        } catch {
            throw NetworkCallError.decodingError
        }
    } else {
        throw NetworkCallError.serviceError
    }
}


func getThreeHourWeather(cityName: String) async throws -> ThreeHourWeather {
    let endpoint = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=75f9685f116b28f3c9b5ad6246d906ae&units=metric"
    // URL() return an optional value so in case if string cannot be parsed into URL
    // we should actually stop function from making a call (hence throwing an error)
    guard let url = URL(string: endpoint) else {
        throw NetworkCallError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    // Casting response into HTTPURLResponse type to get access to status
    // because response is optional, you can use guard let here
    guard let response = response as? HTTPURLResponse else {
        throw NetworkCallError.networkError
    }
    
    if response.statusCode == 200 {
        // If call is successful, decode JSON data
        do {
            let decoder = JSONDecoder()
            
            // Define what strategy should be use for decoding JSON data
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            // Return decoded fetched data (mapped into WeatherResponse struct)
            // First argument is a <Type>.self, next is from what data you are decoding
            return try decoder.decode(ThreeHourWeather.self, from: data)
        } catch {
            throw NetworkCallError.decodingError
        }
    } else {
        throw NetworkCallError.serviceError
    }
}
