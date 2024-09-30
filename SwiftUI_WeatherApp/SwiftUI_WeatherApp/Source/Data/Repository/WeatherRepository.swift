//
//  WeatherRepository.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import Combine

protocol WeatherRepository {
    func getDailyWeatherData() -> AnyPublisher<DailyWeatherDTO, Never>
}

final class DefaultWeatherRepository: WeatherRepository {
    func getDailyWeatherData() -> AnyPublisher<DailyWeatherDTO, Never> {
        let location = "서울특별시"

        let todayWeather: [DailyWeather] = [
            DailyWeather(hour: 0, temperature: 14, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 1, temperature: 12, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 2, temperature: 9, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 3, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 4, temperature: 10, weather: "PartlyCloud", sunStatus: nil),
            DailyWeather(hour: 5, temperature: 10, weather: "ThreadFog", sunStatus: nil),
            DailyWeather(hour: 6, temperature: 10, weather: "Fog", sunStatus: "Sunrise"),
            DailyWeather(hour: 7, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 8, temperature: 15, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 9, temperature: 10, weather: "Fog", sunStatus: nil),
            DailyWeather(hour: 10, temperature: 10, weather: "Blur", sunStatus: nil),
            DailyWeather(hour: 11, temperature: 10, weather: "Thunderstorm", sunStatus: nil),
            DailyWeather(hour: 12, temperature: 21, weather: "Rain", sunStatus: nil),
            DailyWeather(hour: 13, temperature: 22, weather: "Downpour", sunStatus: nil),
            DailyWeather(hour: 14, temperature: 19, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 15, temperature: 10, weather: "freezingRain", sunStatus: nil),
            DailyWeather(hour: 16, temperature: 14, weather: "Drizzle", sunStatus: nil),
            DailyWeather(hour: 17, temperature: 10, weather: "Thunderstorm", sunStatus: nil),
            DailyWeather(hour: 18, temperature: 17, weather: "Cloud", sunStatus: "Sunset"),
            DailyWeather(hour: 19, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 20, temperature: 17, weather: "Snow", sunStatus: nil),
            DailyWeather(hour: 21, temperature: 20, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 22, temperature: 10, weather: "Blizzard", sunStatus: nil),
            DailyWeather(hour: 23, temperature: 12, weather: "Downpour", sunStatus: nil)
        ]
        
        let tomorrowWeather: [DailyWeather] = [
            DailyWeather(hour: 0, temperature: 12, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 1, temperature: 11, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 2, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 3, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 4, temperature: 10, weather: "PartlyCloud", sunStatus: nil),
            DailyWeather(hour: 5, temperature: 10, weather: "ThreadFog", sunStatus: nil),
            DailyWeather(hour: 6, temperature: 10, weather: "Fog", sunStatus: "Sunrise"),
            DailyWeather(hour: 7, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 8, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 9, temperature: 10, weather: "Fog", sunStatus: nil),
            DailyWeather(hour: 10, temperature: 10, weather: "Blur", sunStatus: nil),
            DailyWeather(hour: 11, temperature: 10, weather: "Thunderstorm", sunStatus: nil),
            DailyWeather(hour: 12, temperature: 10, weather: "Rain", sunStatus: nil),
            DailyWeather(hour: 13, temperature: 10, weather: "Downpour", sunStatus: nil),
            DailyWeather(hour: 14, temperature: 10, weather: "Clear", sunStatus: nil),
            DailyWeather(hour: 15, temperature: 10, weather: "freezingRain", sunStatus: nil),
            DailyWeather(hour: 16, temperature: 10, weather: "Drizzle", sunStatus: nil),
            DailyWeather(hour: 17, temperature: 10, weather: "Thunderstorm", sunStatus: nil),
            DailyWeather(hour: 18, temperature: 17, weather: "Cloud", sunStatus: "Sunset"),
            DailyWeather(hour: 19, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 20, temperature: 10, weather: "Snow", sunStatus: nil),
            DailyWeather(hour: 21, temperature: 10, weather: "Cloud", sunStatus: nil),
            DailyWeather(hour: 22, temperature: 10, weather: "Blizzard", sunStatus: nil),
            DailyWeather(hour: 23, temperature: 12, weather: "Downpour", sunStatus: nil)
        ]
        
        let dailyWeatherDTO = DailyWeatherDTO(
            location: location,
            todayWeather: todayWeather,
            tomorrowWeather: tomorrowWeather
        )
        
        return Just(dailyWeatherDTO)
            .eraseToAnyPublisher()
    }
}
