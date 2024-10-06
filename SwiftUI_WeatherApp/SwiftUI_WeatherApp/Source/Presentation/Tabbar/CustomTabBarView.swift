//
//  CustomTabBarView.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/23/24.
//

import SwiftUI

import SwiftUI

enum BottomTab: String, CaseIterable {
    case map = "Map"
    case home = "Home"
    case list = "List"
}

struct CustomTabBarView: View {
    @State private var selectedTab: BottomTab = .home
    @State private var totalPage: Int = 5
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .map:
                MapView()
            case .home:
                HomeView()
            case .list:
                ListView()
            }
            
            CustomTabBar(
                selectedTab: $selectedTab,
                totalPage: $totalPage,
                currentPage: $currentPage
            )
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: BottomTab
    @Binding var totalPage: Int
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        selectedTab = .map
                    }
                }) {
                    Image("map")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 29, height: 27)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .home
                        currentPage = 0
                    }
                }) {
                    HStack {
                        Image("location_arrow")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 13)
                            .foregroundStyle(
                                currentPage == 0 ? .white : .white.opacity(0.45)
                            )
                        ForEach(1..<(totalPage-1), id: \.self) { dot in
                            Circle()
                                .fill(
                                    currentPage == dot ? .white : .white.opacity(0.45)
                                )
                                .frame(width: 9, height: 9)
                        }
                    }
                }
                
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .list
                    }
                }) {
                    Image("line_3_list")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 27)
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 43)
        }
        .frame(height: 98)
        .padding(.horizontal, 20)
        .overlay(
            Rectangle()
                .frame(height: 0.4)
                .foregroundStyle(.white), alignment: .top
        )
    }
}

#Preview {
    CustomTabBarView()
}
