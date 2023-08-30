//
//  shadowing.swift
//  Take-It4
//
//  Created by 小野聡真 on 1823/08/24.
//

import SwiftUI

struct CEditFilterBar: View {
    
    @State var lastWidth: CGFloat = 0
    @State var transedWidth: CGFloat = 0
    @Binding var rate: Double
    
    var barWidth: CGFloat = 110
    
    var drag: some Gesture{
        DragGesture()
            .onChanged { value in
                if barWidth - lastWidth > value.translation.width*1.3 {
                    if lastWidth > -value.translation.width*1.3 {
                        transedWidth = value.translation.width*1.3
                    } else {
                        transedWidth = -lastWidth
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
        RoundedRectangle(cornerRadius: 10,style: .continuous)
            .frame(width: barWidth+12, height: 34)
            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
            .opacity(0.01)
            .gesture(drag)
            .overlay(alignment:.leading){
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .padding(.vertical,14)
                    .frame(width: transedWidth+lastWidth+12)
                    .foregroundColor(Color(red: 0.7-0.1*rate, green: 0.7-0.1*rate, blue: 0.7-0.1*rate))
                    .allowsHitTesting(false)
            }
            .onAppear{
                lastWidth = rate*barWidth
            }
    }
}

//struct shadowing_Previews: PreviewProvider {
//    static var previews: some View {
//        CEditFilterBar()
//    }
//}
