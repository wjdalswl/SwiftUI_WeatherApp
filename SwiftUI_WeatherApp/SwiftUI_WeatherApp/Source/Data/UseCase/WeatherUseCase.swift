//
//  WeatherUseCase.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI
import Combine

protocol WeatherUseCase {
    func getCurrentWeatherData() -> AnyPublisher<(location: String, currentTemperature: Int, currentWeather: String, highestTemperature: Int, lowestTemperature: Int), Never>
    func getDailyWeatherLists() -> AnyPublisher<[(hour: String, temperature: Int, imageName: String)], Never>
}

final class DefaultWeatherUseCase: WeatherUseCase {
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func getCurrentWeatherData() -> AnyPublisher<(location: String, currentTemperature: Int, currentWeather: String, highestTemperature: Int, lowestTemperature: Int), Never> {
        return weatherService.getDailyWeatherData()
            .map { dailyWeatherDTO in
                let currentData = self.weatherService.getCurrentData(dailyWeatherDTO: dailyWeatherDTO)
                
                return (location: currentData.location, currentTemperature: currentData.currentTemperature, currentWeather: currentData.currentWeather, highestTemperature: currentData.highestTemperature, lowestTemperature: currentData.lowestTemperature)
            }
            .eraseToAnyPublisher()
    }
    
    func getDailyWeatherLists() -> AnyPublisher<[(hour: String, temperature: Int, imageName: String)], Never> {
        return weatherService.getDailyWeatherData()
            .map { dailyWeatherDTO in
                let combinedWeatherData = dailyWeatherDTO.todayWeather + dailyWeatherDTO.tomorrowWeather
                let currentHour = Calendar.current.component(.hour, from: Date())
                
                var weatherDataList: [(hour: String, temperature: Int, imageName: String)] = []
                
                for i in 0..<24 {
                    let hour = (currentHour + i) % 24
                    if let weatherData = combinedWeatherData.first(where: { $0.hour == hour }) {
                        let formattedHour = self.weatherService.formatHour(hour: hour, index: i)
                        let imageName = self.weatherService.getWeatherImage(hour: weatherData.hour, weather: weatherData.weather, sunStatus: weatherData.sunStatus ?? "")
                        weatherDataList.append((hour: formattedHour, temperature: weatherData.temperature, imageName: imageName))
                    }
                }
                
                return weatherDataList
            }
            .eraseToAnyPublisher()
    }
}
