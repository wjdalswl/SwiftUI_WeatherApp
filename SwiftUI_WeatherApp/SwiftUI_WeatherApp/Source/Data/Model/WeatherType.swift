//
//  WeatherModel.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

enum WeatherType: String {
    case clear = "Clear"
    case partlyCloud = "PartlyCloud"
    case threadFog = "ThreadFog"
    case fog = "Fog"
    case cloud = "Cloud"
    case Blur = "Blur"
    case thunderstorm = "Thunderstorm"
    case rain = "Rain"
    case downpour = "Downpour"
    case drizzle = "Drizzle"
    case snow = "Snow"
    case blizzard = "Blizzard"
    case freezingRain = "FreezingRain"
    case clearNight = "ClearNight"
    case partlyCloudNight = "PartlyCloudNight"
    case drizzleNight = "DrizzleNight"
    
    func getImageName() -> String {
        switch self {
        case .clear:
            return "ic_Clear"
        case .partlyCloud:
            return "ic_PartlyCloud"
        case .threadFog:
            return "ic_ThreadFog"
        case .fog:
            return "ic_Fog"
        case .cloud:
            return "ic_Cloud"
        case .Blur:
            return "ic_Blur"
        case .thunderstorm:
            return "ic_Thunderstorm"
        case .rain:
            return "ic_Rain"
        case .downpour:
            return "ic_Downpour"
        case .drizzle:
            return "ic_Drizzle"
        case .snow:
            return "ic_Snow"
        case .blizzard:
            return "ic_Blizzard"
        case .freezingRain:
            return "ic_FreezingRain"
        case .clearNight:
            return "ic_ClearNight"
        case .partlyCloudNight:
            return "ic_PartlyCloudNight"
        case .drizzleNight:
            return "ic_DrizzleNight"
            
        }
    }
}
