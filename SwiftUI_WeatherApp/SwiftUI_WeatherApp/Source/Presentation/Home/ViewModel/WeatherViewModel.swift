//
//  WeatherViewModel.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI
import Combine

final class WeatherViewModel: ObservableObject {
    @Published var weatherData: [(hour: Int, temperature: Int, imageName: String)] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let weatherUseCase: WeatherUseCase
    
    init(fetchWeatherUseCase: WeatherUseCase) {
        self.weatherUseCase = fetchWeatherUseCase
        getWeatherData()
    }
    
    func getWeatherData() {
        weatherUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] weatherData in
                self?.weatherData = weatherData
            })
            .store(in: &cancellables)
    }
}
