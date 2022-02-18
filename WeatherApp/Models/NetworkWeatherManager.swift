//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Temirlan Idrissov on 17.02.2022.
//

import Foundation

protocol NetworkWeatherManagerDelegate: class  {
    func updateInterface(_: NetworkWeatherManager,with currentWeather: CurrentWeather)
}

class NetworkWeatherManager {
    weak var delegate: NetworkWeatherManagerDelegate?
    
    func fetchCurrentWeather(forCity city: String)  {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString!)
                if let currentWeather = self.parseJSON(withData: data) {
                    self.delegate?.updateInterface(self, with: currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData)
            else {
                return nil
            }
            return currentWeather
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
