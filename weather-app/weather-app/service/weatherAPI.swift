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

func getCurrentWeather() async throws -> Weather {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=API_KEY&units=metric"
    
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
