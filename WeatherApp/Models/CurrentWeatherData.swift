//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Temirlan Idrissov on 17.02.2022.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
