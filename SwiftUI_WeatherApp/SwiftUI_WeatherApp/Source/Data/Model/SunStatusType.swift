//
//  SunStatusType.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/30/24.
//

import SwiftUI

enum SunStatusType: String {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
    
    func getImageName() -> String {
        switch self {
        case .sunrise:
            return "ic_Sunrise"
        case .sunset:
            return "ic_Sunset"
        }
    }
}
