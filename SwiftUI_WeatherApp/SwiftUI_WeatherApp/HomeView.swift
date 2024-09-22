//
//  ContentView.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/23/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 0) {
                    Text("Seongnam-si")
                        .font(.system(size: 37, weight: .regular))
                        .foregroundColor(.white)
                    Text("21º")
                        .font(.system(size: 102, weight: .ultraLight))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: -15, leading: 0, bottom: -11, trailing: 0))
                    Text("Partly Cloudy")
                        .font(.system(size: 24, weight: .regular))
                        .foregroundColor(.white)
                    HStack {
                        Text("H:29°")
                            .font(.system(size: 21, weight: .medium))
                            .foregroundColor(.white)
                        Text("L:15°")
                            .font(.system(size: 21, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 78)
            }
        }
    }
}

#Preview {
    HomeView()
}
