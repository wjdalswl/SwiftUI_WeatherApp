//
//  WeatherViewModel.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI
import Combine

final class WeatherViewModel: ObservableObject {
    @Published var currentWeatherData: (location: String, currentTemperature: Int, currentWeather: String, highestTemperature: Int, lowestTemperature: Int)?
    @Published var weatherData: [(hour: String, temperature: Int, imageName: String)] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let weatherUseCase: WeatherUseCase
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        
        getCurrentWeatherData()
        getDailyWeatherData()
    }
    
    private func getCurrentWeatherData() {
        weatherUseCase.getCurrentWeatherData()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] currentWeather in
                self?.currentWeatherData = currentWeather
            })
            .store(in: &cancellables)
    }
    
    private func getDailyWeatherData() {
        weatherUseCase.getDailyWeatherLists()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] weatherData in
                self?.weatherData = weatherData
            })
            .store(in: &cancellables)
    }
}
