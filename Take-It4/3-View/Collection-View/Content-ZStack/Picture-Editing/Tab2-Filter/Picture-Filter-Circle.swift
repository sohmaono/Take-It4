//
//  Picture-Filter-Circle.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//

import SwiftUI

struct CFilterCircle: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    @State var geometrySize: CGSize = .zero
    @State var stopCalculate = false
    @State var stopCalculateDone = false
    
    func settingTrimColorPoint(){
        if editPicData.filterCircleData.degrees1 == editPicData.filterCircleData.degrees2 {
            if editPicData.filterCircleData.countLongWay {
                editPicData.filterCircleData.trimFrom = 0
                editPicData.filterCircleData.trimTo = 1
                editPicData.red = 0.8
                editPicData.green = 0.8
                editPicData.blue = 0.8
            } else {
                editPicData.filterCircleData.trimFrom = 0
                editPicData.filterCircleData.trimTo = 0
                calculateColorArray()
            }
        } else if editPicData.filterCircleData.countLongWay == (abs(editPicData.filterCircleData.degrees1 - editPicData.filterCircleData.degrees2) > 180){
            
            editPicData.filterCircleData.openTrim2 = false
            editPicData.filterCircleData.trimFrom = min(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2) / 360
            
            editPicData.filterCircleData.trimTo = max(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2) / 360
            
            calculateColorArray()
        } else {
            
            editPicData.filterCircleData.openTrim2 = true
            editPicData.filterCircleData.trimFrom = max(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2) / 360
            editPicData.filterCircleData.trimTo = 1
            editPicData.filterCircleData.trimTo2 = min(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2) / 360
            
            calculateColorArray()
        }
    }
    
    func calculateColorArray(){
        let colorArray = CalculateColorMultiply(
            start: Int(min(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2)),
            end: Int(max(
                editPicData.filterCircleData.degrees1,
                editPicData.filterCircleData.degrees2)),
            colorTotal: 0.2)
        
        editPicData.red = colorArray[0]
        editPicData.green = colorArray[1]
        editPicData.blue = colorArray[2]
    }
    
    var dragRotate1: some Gesture{
        DragGesture()
            .onChanged { change in
                if !editPicData.filterCircleData.startedDrag2{
                    if !editPicData.filterCircleData.startedDrag1{
                        editPicData.filterCircleData.startedDrag1 = true
                        if editPicData.filterCircleData.degrees2 < 180{
                            editPicData.filterCircleData.degrees180point = editPicData.filterCircleData.degrees2 + 180
                        } else {
                            editPicData.filterCircleData.degrees180point = editPicData.filterCircleData.degrees2 - 180
                        }
                    }
                    editPicData.filterCircleData.radian1 = atan2(change.location.y - geometrySize.height/2,change.location.x - geometrySize.width/2)
                    if editPicData.filterCircleData.radian1 < 0 {
                        editPicData.filterCircleData.degrees1 =
                        360 + (editPicData.filterCircleData.radian1 / .pi * 7.5).rounded()*24
                    } else {
                        editPicData.filterCircleData.degrees1 =
                        (editPicData.filterCircleData.radian1 / .pi * 7.5).rounded()*24
                    }
                }
            }
            .onEnded { _ in
                editPicData.filterCircleData.startedDrag1 = false
            }
    }
    
    var dragRotate2: some Gesture{
        DragGesture()
            .onChanged { change in
                if !editPicData.filterCircleData.startedDrag1{
                    if !editPicData.filterCircleData.startedDrag2{
                        editPicData.filterCircleData.startedDrag2 = true
                        if editPicData.filterCircleData.degrees1 < 180{
                            editPicData.filterCircleData.degrees180point = editPicData.filterCircleData.degrees1 + 180
                        } else {
                            editPicData.filterCircleData.degrees180point = editPicData.filterCircleData.degrees1 - 180
                        }
                    }
                    editPicData.filterCircleData.radian2 = atan2(
                        change.location.y - geometrySize.height/2,
                        change.location.x - geometrySize.width/2)
                    
                    if editPicData.filterCircleData.radian2 < 0{
                        editPicData.filterCircleData.degrees2 =
                        360 + (editPicData.filterCircleData.radian2 / .pi * 7.5).rounded()*24
                    } else {
                        editPicData.filterCircleData.degrees2 =
                        (editPicData.filterCircleData.radian2 / .pi * 7.5).rounded()*24
                    }
                }
            }
            .onEnded { _ in
                editPicData.filterCircleData.startedDrag2 = false
            }
    }
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 3)
            .frame(width: 125,height:125)
            .foregroundColor(Color(red:0.9, green: 0.9, blue: 0.9))
            .overlay{
                GeometryReader { geometry in
                    
                    ZStack {
                        ForEach(0..<15){ item in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: item % 5 == 0 ? 7 : 0,height: 4)
                                .foregroundColor(Color(red:0.9, green: 0.9, blue: 0.9))
                                .offset(x:geometrySize.width/2)
                                .rotationEffect(.degrees(Double(item*24)))
                        }
                        
                        Button {
                            stopCalculate = true
                            editPicData.resetFilterCircleData()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 55,height:22)
                                    .foregroundColor(.blue)
                                Text("Reset")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12.5))
                                    .bold()
                            }
                        }
                        .position(x: geometrySize.width/2, y: geometrySize.height/2)
                        
                        Circle()
                            .trim(from: editPicData.filterCircleData.trimFrom, to: editPicData.filterCircleData.trimTo)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color(red:0.7, green: 0.7, blue: 0.7))
                        
                        if editPicData.filterCircleData.openTrim2{
                            Circle()
                                .trim(from: 0, to: editPicData.filterCircleData.trimTo2)
                                .stroke(lineWidth: 4)
                                .foregroundColor(Color(red:0.7, green: 0.7, blue: 0.7))
                        }
                        
                        Circle()
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 16, height: 16)
                            .position(x: geometrySize.width/2, y: geometrySize.height/2)
                            .offset(x:geometrySize.width/2)
                            .rotationEffect(.init(degrees: editPicData.filterCircleData.degrees1))
                            .gesture(dragRotate1)
                        Circle()
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 16, height: 16)
                            .position(x: geometrySize.width/2, y: geometrySize.height/2)
                            .offset(x:geometrySize.width/2)
                            .rotationEffect(.init(degrees: editPicData.filterCircleData.degrees2))
                            .gesture(dragRotate2)
                        
                    }
                    .onAppear{
                        geometrySize = geometry.size
                    }
                    
                    .onChange(of: editPicData.filterCircleData.degrees1) { newValue in
                        if !stopCalculate{
                            if (editPicData.filterCircleData.oldDegrees1 + newValue)/2 == editPicData.filterCircleData.degrees180point && abs(editPicData.filterCircleData.oldDegrees1 - newValue) == 24{
                                editPicData.filterCircleData.countLongWay.toggle()
                            }
                            if editPicData.filterCircleData.oldDegrees1 == editPicData.filterCircleData.degrees2 {
                                editPicData.filterCircleData.countLongWay = false
                            }
                            settingTrimColorPoint()
                            editPicData.filterCircleData.oldDegrees1 = newValue
                        } else if stopCalculateDone {
                            stopCalculate = false
                            stopCalculateDone = false
                        } else {
                            stopCalculateDone = true
                        }
                    }
                    
                    .onChange(of: editPicData.filterCircleData.degrees2) { newValue in
                        if !stopCalculate{
                            if (editPicData.filterCircleData.oldDegrees2 + newValue)/2 == editPicData.filterCircleData.degrees180point && abs(editPicData.filterCircleData.oldDegrees2 - newValue) == 24 {
                                editPicData.filterCircleData.countLongWay.toggle()
                            }
                            if editPicData.filterCircleData.oldDegrees2 == editPicData.filterCircleData.degrees1 {
                                editPicData.filterCircleData.countLongWay = false
                            }
                            settingTrimColorPoint()
                            editPicData.filterCircleData.oldDegrees2 = newValue
                        } else if stopCalculateDone {
                            stopCalculateDone = false
                            stopCalculate = false
                        } else {
                            stopCalculateDone = true
                        }
                    }
                }
            }
    }
}

//struct Picture_Filter_Circle_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureFilterCircle()
//    }
//}
