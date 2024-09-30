//
//  WeatherUseCase.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI
import Combine

protocol WeatherUseCase {
    func execute() -> AnyPublisher<[(hour: String, temperature: Int, imageName: String)], Never>
}

final class DefaultWeatherUseCase: WeatherUseCase {
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func execute() -> AnyPublisher<[(hour: String, temperature: Int, imageName: String)], Never> {
        return weatherRepository.getWeatherData()
            .map { dailyWeatherDTO -> [(String, Int, String)] in
                let combinedWeatherData = dailyWeatherDTO.todayWeather + dailyWeatherDTO.tomorrowWeather
                
                let currentHour = Calendar.current.component(.hour, from: Date())
                var filteredData: [(String, Int, String)] = []
                
                for i in 0..<24 {
                    let hour = (currentHour + i) % 24
                    if let data = combinedWeatherData.first(where: { $0.hour == hour }) {
                        
                        let formattedHour: String
                        if i == 0 {
                            formattedHour = "지금"
                        } else {
                            formattedHour = hour >= 12 ? "오후 \(hour == 12 ? 12 : hour - 12)시" : "오전 \(hour == 0 ? 12 : hour)시"
                        }
                        
                        if let sunStatusRawValue = data.sunStatus, let sunStatus = SunStatusType(rawValue: sunStatusRawValue) {
                            filteredData.append((formattedHour, data.temperature, sunStatus.getImageName()))
                        } else if let weather = WeatherType(rawValue: data.weather) {
                            let isNight = hour >= 18 || hour < 6
                            let imageName: String
                            
                            switch weather {
                            case .clear:
                                imageName = isNight ? WeatherType.clearNight.getImageName() : WeatherType.clear.getImageName()
                            case .partlyCloud:
                                imageName = isNight ? WeatherType.partlyCloudNight.getImageName() : WeatherType.partlyCloud.getImageName()
                            case .drizzle:
                                imageName = isNight ? WeatherType.drizzleNight.getImageName() : WeatherType.drizzle.getImageName()
                            default:
                                imageName = weather.getImageName()
                            }
                            filteredData.append((formattedHour, data.temperature, imageName))
                        } else {
                            filteredData.append((formattedHour, data.temperature, WeatherType.clear.getImageName()))
                        }
                    }
                }
                
                return filteredData
            }
            .eraseToAnyPublisher()
    }
}
