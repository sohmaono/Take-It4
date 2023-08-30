//
//  shadowing.swift
//  Take-It4
//
//  Created by 小野聡真 on 1823/08/24.
//

import SwiftUI

struct CFilterBar: View {
    
    @State var lastWidth: CGFloat = 27
    @State var transedWidth: CGFloat = 0
    @Binding var rate: Double
    
    var barWidth: CGFloat = 200
    
    var drag: some Gesture{
        DragGesture()
            .onChanged { value in
                if barWidth - lastWidth > value.translation.width*1.3 {
                    if lastWidth - 27 > -value.translation.width*1.3 {
                        transedWidth = value.translation.width*1.3
                    } else {
                        transedWidth = -lastWidth + 27
                    }
                } else {
                    transedWidth = barWidth - lastWidth
                }
                
                rate = (transedWidth + lastWidth)/barWidth
            }
            .onEnded { _ in
                lastWidth += transedWidth
                transedWidth = 0
            }
    }
    
    var body: some View {
        
        VStack(spacing:60){
            RoundedRectangle(cornerRadius: 10,style: .continuous)
            //                .stroke(lineWidth: 3)
                .frame(width: barWidth, height: 22)
                .foregroundColor(
                    Color.white)
                .gesture(drag)
                .overlay(alignment:.leading){
                    RoundedRectangle(cornerRadius: 10)
                        .padding(.vertical,5)
                        .padding(.horizontal,5)
                        .frame(width: transedWidth+lastWidth)
                        .foregroundColor(
                            Color(
                                red: 0.05,
                                green: 0.1,
                                blue: 0.4+0.35*rate)
                            .opacity(0.8))
                        .allowsHitTesting(false)
                }
        }
    }
}
//
//struct shadowing_Previews: PreviewProvider {
//    static var previews: some View {
//        CFilterBar()
//    }
//}
