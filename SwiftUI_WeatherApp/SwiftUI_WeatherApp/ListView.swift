//
//  ListView.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 9/23/24.
//


import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Text("날짜 리스트")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ListView()
}
