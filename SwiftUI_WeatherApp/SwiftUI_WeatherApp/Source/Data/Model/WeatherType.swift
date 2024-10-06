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
    case wind = "Wind"
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
        case .wind:
            return "ic_Wind"
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
    
    func getKoreanName() -> String {
        switch self {
        case .clear:
            return "청명함"
        case .partlyCloud:
            return "한때 흐림"
        case .threadFog:
            return "실안개"
        case .fog:
            return "안개"
        case .wind:
            return "미풍"
        case .cloud:
            return "흐림"
        case .Blur:
            return "연무"
        case .thunderstorm:
            return "뇌우"
        case .rain:
            return "비"
        case .downpour:
            return "호우"
        case .drizzle:
            return "이슬비"
        case .snow:
            return "눈"
        case .blizzard:
            return "눈보라"
        case .freezingRain:
            return "얼음비"
        case .clearNight:
            return "청명함"
        case .partlyCloudNight:
            return "한때 흐림(밤)"
        case .drizzleNight:
            return "이슬비(밤)"
        }
    }
}
