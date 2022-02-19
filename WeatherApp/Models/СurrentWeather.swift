//
//  СurrentWeather.swift
//  WeatherApp
//
//  Created by Temirlan Idrissov on 17.02.2022.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureToString: String {
        return String(format: "%.0f", temperature)
    }
    
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureToString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bold.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    let descriptionWeather: String
    var descriptionWeatherCapitalized: String {
        return descriptionWeather.capitalized
    }
    
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feels_like
        conditionCode = currentWeatherData.weather.first!.id
        descriptionWeather = currentWeatherData.weather.first!.description
    }
    
}

