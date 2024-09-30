//
//  DailyWeatherModel.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI

struct DailyWeatherDTO: Codable {
    let location: String
    let todayWeather: [DailyWeather]
    let tomorrowWeather: [DailyWeather]
}

struct DailyWeather: Codable {
    let hour: Int
    let temperature: Int
    let weather: String
    let sunStatus: String?
}
