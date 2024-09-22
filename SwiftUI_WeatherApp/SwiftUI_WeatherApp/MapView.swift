//
//  MapView.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/23/24.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Text("지도")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    MapView()
}
