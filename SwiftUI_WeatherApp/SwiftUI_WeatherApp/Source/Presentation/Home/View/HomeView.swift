//
//  ContentView.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/23/24.
//

import SwiftUI



struct HomeView: View {
    @StateObject var viewModel = WeatherViewModel(
        weatherUseCase: DefaultWeatherUseCase(
            weatherService: DefaultWeatherService(
                weatherRepository: DefaultWeatherRepository()
            )
        )
    )
    
    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                if let currentWeather = viewModel.currentWeatherData {
                    VStack(spacing: 0) {
                        Text("\(currentWeather.location)")
                            .font(.system(size: 37, weight: .regular))
                            .foregroundStyle(.white)
                        Text(" \(currentWeather.currentTemperature)°")
                            .font(.system(size: 102, weight: .ultraLight))
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top: -15, leading: 0, bottom: -11, trailing: 0))
                        Text("\(currentWeather.currentWeather)")
                            .font(.system(size: 24, weight: .regular))
                            .foregroundStyle(.white)
                        HStack {
                            Text("최고: \(currentWeather.highestTemperature)°")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundStyle(.white)
                            Text("최저: \(currentWeather.lowestTemperature)°")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 78)
                }
                
                
                VStack(spacing: 14) {
                    Text("내일의 최고 기온은 21°로, 더 낮은 기온이 예상됩니다.")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Rectangle()
                        .fill(.white.opacity(0.2))
                        .frame(height: 1)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 29) {
                            ForEach(viewModel.weatherData, id: \.hour) { data in
                                VStack(spacing: 10) {
                                    Text("\(data.hour)")
                                        .font(.system(size: 17, weight: .medium))
                                        .foregroundStyle(.white)
                                    
                                    Image(data.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 40)
                                    
                                    Text(" \(data.temperature)°")
                                        .font(.system(size: 22, weight: .medium))
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    }
                }
                .padding(15)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(.blue.opacity(0.15))
                .cornerRadius(15)
            }
        }
    }
}

#Preview {
    HomeView()
}
