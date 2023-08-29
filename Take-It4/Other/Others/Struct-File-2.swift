//
//  Struct-File-2.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct Position:Equatable,Codable{
    var x: CGFloat
    var y: CGFloat
}

struct ColorCircleStruct{
    var degrees1: Double
    var degrees2: Double
    var countLongWay: Bool
}

struct EditPictureData{
    var colorCircleInf = ColorCircleStruct(degrees1: 288, degrees2: 288, countLongWay: false)
    var comment = ""
    var num1: Double = 0
    var num2: Double = 0
    var num3: Double = 0
    var num4: Double = 0
}

struct ClippingPictureData{
    var top: CGFloat = 0
    var bottom: CGFloat = 0
    var left: CGFloat = 0
    var right: CGFloat = 0
    var geometrySize: CGSize = .zero
    
    var dragging = false
    var graphOpacity: Double = 0
    var blackOpacity: Double = 0.45
    
    var widthAverage: CGFloat{
        (right + left)/2
    }
    var heightAverage: CGFloat{
        (top + bottom)/2
    }
    var clippedWidth: CGFloat{
        right - left
    }
    var clippedHeight: CGFloat{
        bottom - top
    }
}

struct CFilterCircleData {
    var degrees1 = 288.0
    var degrees2 = 288.0
    var countLongWay = false
    
    
    var degrees180point: Double = 0
    
    var trimFrom: Double = 0
    var trimTo: Double = 0
    var openTrim2 = false
    var trimTo2: Double = 0
    
    var radian1: Double = 0
    var oldDegrees1: Double = 0
    var startedDrag1 = false
    
    var radian2: Double = 0
    var oldDegrees2: Double = 0
    var startedDrag2 = false
}
