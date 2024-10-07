//
//  CustomProgressBar.swift
//  SwiftUI_WeatherApp
//
//  Created by 정민지 on 10/7/24.
//

import SwiftUI

struct CustomProgressBar: View {
    var startValue: CGFloat
    var endValue: CGFloat
    var circleValue: CGFloat?
    
    let steps: [CGFloat] = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 5)
                    
                    Capsule()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .yellow, .orange]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: widthForRange(totalWidth: geometry.size.width), height: 5)
                        .offset(x: widthForStartOffset(totalWidth: geometry.size.width))
                    
                    if let circleValue = circleValue {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .offset(x: widthForCircleOffset(circleValue, totalWidth: geometry.size.width))
                    }
                }
                .padding()
            }
        }
    }
    
    func widthForStartOffset(totalWidth: CGFloat) -> CGFloat {
        let effectiveWidth = totalWidth - 60
        let ratio = startValue / 100
        return effectiveWidth * ratio
    }
    
    func widthForRange(totalWidth: CGFloat) -> CGFloat {
        let effectiveWidth = totalWidth - 60
        let ratio = (endValue - startValue) / 100
        return effectiveWidth * ratio
    }
    
    func widthForCircleOffset(_ value: CGFloat, totalWidth: CGFloat) -> CGFloat {
        let effectiveWidth = totalWidth - 60
        let ratio = (value - startValue) / (endValue - startValue)
        return effectiveWidth * ratio + widthForStartOffset(totalWidth: totalWidth) - 10
    }
}

#Preview {
    CustomProgressBar(startValue: 20, endValue: 80, circleValue: 40)
}
