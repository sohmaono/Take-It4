//
//  class-otherData.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/29.
//

import SwiftUI

class COtherData: ObservableObject {
    //getting geometry
    @Published var toggleAndGetGeometry = false
    @Published var firstGeometryPosition: CGFloat = 0
    @Published var scrolledLength: CGFloat = 0
    
    //show1↓
    @Published var show1 = false
    @Published var openPicker = false
    func show1toggle(_ sec:Double){
        withAnimation(.easeOut(duration:sec)){
            show1.toggle()
        }
    }
}
