//
//  ExampleViewController.swift
//  WeatherApp
//
//  Created by Temirlan Idrissov on 17.02.2022.
//

import UIKit
import SnapKit

class ExampleViewController: UIViewController {
    
    private let weatherIconImageView: UIImageView = {
        var icon = UIImageView()
        let boldFont = UIFont.boldSystemFont(ofSize: 124)
        let configuration = UIImage.SymbolConfiguration(font: boldFont)
        return icon
    }()
    
    private let labelText: UILabel = {
        let labelText = UILabel()
        labelText.text = "Какая сегодня погода?"
        labelText.font = .systemFont(ofSize: 34, weight: .semibold)
        return labelText
    }()
    private let weatherText: UILabel = {
        let labelText = UILabel()
        labelText.text = ""
        labelText.font = .systemFont(ofSize: 34, weight: .semibold)
        return labelText
    }()
    
    private let searchButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 16
        button.addTarget(self,action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        setUpUi()
        networkWeatherManager.delegate = self
       
    }
    
    private func setUpUi() {
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        view.addSubview(labelText)
        labelText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        view.addSubview(weatherText)
        weatherText.snp.makeConstraints { make in
            make.top.equalTo(labelText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(weatherIconImageView)
        weatherIconImageView.snp.makeConstraints { make in
            make.bottom.equalTo(labelText.snp.top).offset(-15)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func handleButton() {
//        let alert = UIAlertController(title: "Enter city name", message: nil, preferredStyle: .alert)
//        self.present(alert, animated: true , completion: nil)
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) 
        }
    }

}

extension ExampleViewController: NetworkWeatherManagerDelegate {
    
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        DispatchQueue.main.async {
            self.labelText.text = currentWeather.cityName
            self.weatherText.text = currentWeather.temperatureToString  + " ℃"
            self.weatherIconImageView.image = UIImage(systemName: currentWeather.systemIconNameString)
        }
    }
    
    
}
