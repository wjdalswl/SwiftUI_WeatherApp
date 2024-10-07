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
                
                VStack {
                    HStack {
                        Image("ic_Calendar")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                        
                        Text("10일간의 일기예보")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.gray)
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .fill(.white.opacity(0.2))
                        .frame(height: 1)
                    
                    ForEach(0..<10, id: \.self) { index in
                        HStack {
                            
                            Text("오늘")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundStyle(.white)
                            
                            Image("ic_PartlyCloud")
                                .resizable()
                                .frame(width: 35, height: 30)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            
                            Text("16°")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundStyle(.gray)
                            
                            CustomProgressBar(startValue: 20, endValue: 80, circleValue: 40)
                                .frame(width: 110)
                            
                            Text("19°")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                        if index < 9 {
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(height: 1)
                        }
                    }
                }
                .padding(15)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(.blue.opacity(0.15))
                .cornerRadius(15)
                
                Spacer(minLength: 50)
            }
        }
    }
}

#Preview {
    HomeView()
}
