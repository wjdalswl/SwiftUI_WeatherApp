//
//  WeatherUseCase.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI
import Combine

protocol WeatherUseCase {
    func execute() -> AnyPublisher<[(hour: Int, temperature: Int, imageName: String)], Never>
}

final class DefaultWeatherUseCase: WeatherUseCase {
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func execute() -> AnyPublisher<[(hour: Int, temperature: Int, imageName: String)], Never> {
        return weatherRepository.getWeatherData()
            .map { dailyWeatherDTO in
                let combinedWeatherData = dailyWeatherDTO.todayWeather + dailyWeatherDTO.tomorrowWeather
                
                let currentHour = Calendar.current.component(.hour, from: Date())
                var filteredData: [(Int, Int, String)] = []
                
                for i in 0..<24 {
                    let hour = (currentHour + i) % 24
                    if let data = combinedWeatherData.first(where: { $0.hour == hour }) {
                        if let sunStatusRawValue = data.sunStatus, let sunStatus = SunStatusType(rawValue: sunStatusRawValue) {
                            filteredData.append((hour, data.temperature, sunStatus.getImageName()))
                        } else if let weather = WeatherType(rawValue: data.weather) {
                            filteredData.append((hour, data.temperature, weather.getImageName()))
                        } else {
                            filteredData.append((hour, data.temperature, WeatherType.clear.getImageName()))
                        }
                    }
                }
                
                return filteredData
            }
            .eraseToAnyPublisher()
    }
}
