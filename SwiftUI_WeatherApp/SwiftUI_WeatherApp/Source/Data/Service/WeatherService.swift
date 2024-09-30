//
//  WeatherService.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 10/1/24.
//

import SwiftUI
import Combine

protocol WeatherService {
    func getDailyWeatherData() -> AnyPublisher<DailyWeatherDTO, Never>
    func getCurrentData(dailyWeatherDTO: DailyWeatherDTO) -> (location: String, currentTemperature: Int, currentWeather: String, highestTemperature: Int, lowestTemperature: Int)
    func getTodayAndTomorrowWeatherList(dailyWeatherDTO: DailyWeatherDTO) -> (todayWeather: [DailyWeather], tomorrowWeather: [DailyWeather])
    func formatHour(hour: Int, index: Int) -> String
    func getWeatherImage(hour: Int, weather: String, sunStatus: String?) -> String
}

final class DefaultWeatherService: WeatherService {
    
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getDailyWeatherData() -> AnyPublisher<DailyWeatherDTO, Never> {
        return weatherRepository.getDailyWeatherData()
    }
    
    func getCurrentData(dailyWeatherDTO: DailyWeatherDTO) -> (location: String, currentTemperature: Int, currentWeather: String, highestTemperature: Int, lowestTemperature: Int) {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        let currentWeatherData = dailyWeatherDTO.todayWeather.first(where: { $0.hour == currentHour })
        let currentTemperature = currentWeatherData?.temperature ?? 0
        let currentWeatherEnum = WeatherType(rawValue: currentWeatherData?.weather ?? "Unknown")
        let currentWeatherKorean = currentWeatherEnum?.getKoreanName() ?? "알 수 없음"
        
        let highestTemperature = dailyWeatherDTO.todayWeather.max(by: { $0.temperature < $1.temperature })?.temperature ?? 0
        let lowestTemperature = dailyWeatherDTO.todayWeather.min(by: { $0.temperature < $1.temperature })?.temperature ?? 0
        
        return (location: dailyWeatherDTO.location, currentTemperature: currentTemperature, currentWeather: currentWeatherKorean, highestTemperature: highestTemperature, lowestTemperature: lowestTemperature)
    }
    
    func getTodayAndTomorrowWeatherList(dailyWeatherDTO: DailyWeatherDTO) -> (todayWeather: [DailyWeather], tomorrowWeather: [DailyWeather]) {
        return (todayWeather: dailyWeatherDTO.todayWeather, tomorrowWeather: dailyWeatherDTO.tomorrowWeather)
    }
    
    func formatHour(hour: Int, index: Int) -> String {
        if index == 0 {
            return "지금"
        } else {
            return hour >= 12 ? "오후 \(hour == 12 ? 12 : hour - 12)시" : "오전 \(hour == 0 ? 12 : hour)시"
        }
    }
    
    func getWeatherImage(hour: Int, weather: String, sunStatus: String?) -> String {
        let isNight = hour >= 18 || hour < 6
        if let sunStatus = sunStatus, SunStatusType(rawValue: sunStatus) != nil {
            return WeatherType.clear.getImageName()
        } else if let weatherEnum = WeatherType(rawValue: weather) {
            switch weatherEnum {
            case .clear:
                return isNight ? WeatherType.clearNight.getImageName() : WeatherType.clear.getImageName()
            case .partlyCloud:
                return isNight ? WeatherType.partlyCloudNight.getImageName() : WeatherType.partlyCloud.getImageName()
            case .drizzle:
                return isNight ? WeatherType.drizzleNight.getImageName() : WeatherType.drizzle.getImageName()
            default:
                return weatherEnum.getImageName()
            }
        }
        return WeatherType.clear.getImageName()
    }
}
