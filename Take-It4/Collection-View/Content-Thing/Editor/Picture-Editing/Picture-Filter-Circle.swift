//
//  Picture-Filter-Circle.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//

import SwiftUI

struct PictureFilterCircle: View {
    @State var degrees180point: Double = 0
    
    @State var trimFrom: Double = 0
    @State var trimTo: Double = 0
    @State var openTrim2 = false
    @State var trimTo2: Double = 0
    
    @State var radian1: Double = 0
    @State var oldDegrees1: Double = 0
    @State var startedDrag1 = false
    
    @State var radian2: Double = 0
    @State var oldDegrees2: Double = 0
    @State var startedDrag2 = false
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    
    @State var geometrySize: CGSize = .zero
    
    func settingTrimColorPoint(){
        if editPicData.editPictureData.colorCircleInf.degrees1 == editPicData.editPictureData.colorCircleInf.degrees2 {
            if editPicData.editPictureData.colorCircleInf.countLongWay {
                trimFrom = 0
                trimTo = 1
                contInfo.selectedPicInfo!.colorArray = [0.85,0.85,0.85]
            } else {
                trimFrom = 0
                trimTo = 0
                contInfo.selectedPicInfo!.colorArray = [1,1,1]
            }
        } else if editPicData.editPictureData.colorCircleInf.countLongWay == (abs(editPicData.editPictureData.colorCircleInf.degrees1 - editPicData.editPictureData.colorCircleInf.degrees2) > 180){
            openTrim2 = false
            trimFrom = min(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2) / 360
            trimTo = max(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2) / 360
            contInfo.selectedPicInfo!.colorArray = CalculateColorMultiply(start: Int(min(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2)), end: Int(max(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2)), colorTotal: 0.2,longWay: editPicData.editPictureData.colorCircleInf.countLongWay)
        } else {
            openTrim2 = true
            trimFrom = max(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2) / 360
            trimTo = 1
            trimTo2 = min(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2) / 360
            contInfo.selectedPicInfo!.colorArray = CalculateColorMultiply(start: Int(max(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2))%360, end: Int(min(editPicData.editPictureData.colorCircleInf.degrees1,editPicData.editPictureData.colorCircleInf.degrees2))%360, colorTotal: 0.25 ,longWay: editPicData.editPictureData.colorCircleInf.countLongWay)
        }
    }
    
    var dragRotate1: some Gesture{
        DragGesture()
            .onChanged { change in
                if !startedDrag2{
                    if !startedDrag1{
                        startedDrag1 = true
                        if editPicData.editPictureData.colorCircleInf.degrees2 <= 180{
                            degrees180point = editPicData.editPictureData.colorCircleInf.degrees2 + 180
                        } else {
                            degrees180point = editPicData.editPictureData.colorCircleInf.degrees2 - 180
                        }
                    }
                    radian1 = atan2(change.location.y - geometrySize.height/2,change.location.x - geometrySize.width/2)
                    if radian1 <= 0 {
                        editPicData.editPictureData.colorCircleInf.degrees1 = 360 + (radian1 / .pi * 7.5).rounded()*24
                    } else {
                        let a = (radian1 / .pi * 7.5).rounded()*24
                        if a != 0 {
                            editPicData.editPictureData.colorCircleInf.degrees1 = a
                        } else {
                            editPicData.editPictureData.colorCircleInf.degrees1 = 360
                        }
                    }
                }
            }
            .onEnded { _ in
                startedDrag1 = false
            }
    }
    
    var dragRotate2: some Gesture{
        DragGesture()
            .onChanged { change in
                if !startedDrag1{
                    if !startedDrag2{
                        startedDrag2 = true
                        if editPicData.editPictureData.colorCircleInf.degrees1 <= 180{
                            degrees180point = editPicData.editPictureData.colorCircleInf.degrees1 + 180
                        } else {
                            degrees180point = editPicData.editPictureData.colorCircleInf.degrees1 - 180
                        }
                    }
                    radian2 = atan2(change.location.y - geometrySize.height/2,change.location.x - geometrySize.width/2)
                    if radian2 <= 0{
                        editPicData.editPictureData.colorCircleInf.degrees2 = 360 + (radian2 / .pi * 7.5).rounded()*24
                    } else {
                        let a = (radian2 / .pi * 7.5).rounded()*24
                        if a != 0{
                            editPicData.editPictureData.colorCircleInf.degrees2 = a
                        } else {
                            editPicData.editPictureData.colorCircleInf.degrees2 = 360
                        }
                    }
                }
            }
            .onEnded { _ in
                startedDrag2 = false
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
                            editPicData.editPictureData.colorCircleInf.countLongWay = false
                            editPicData.editPictureData.colorCircleInf.degrees1 = 360
                            editPicData.editPictureData.colorCircleInf.degrees2 = 360
                            DispatchQueue.main.async {
                                openTrim2 = false
                                settingTrimColorPoint()
                            }
                            contInfo.selectedPicInfo!.colorArray = [1,1,1]
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
                            .trim(from: trimFrom, to: trimTo)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color(red:0.7, green: 0.7, blue: 0.7))
                        
                        if openTrim2{
                            Circle()
                                .trim(from: 0, to: trimTo2)
                                .stroke(lineWidth: 4)
                                .foregroundColor(Color(red:0.7, green: 0.7, blue: 0.7))
                        }
                        
                        Circle()
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 16, height: 16)
                            .position(x: geometrySize.width/2, y: geometrySize.height/2)
                            .offset(x:geometrySize.width/2)
                            .rotationEffect(.init(degrees: editPicData.editPictureData.colorCircleInf.degrees1))
                            .gesture(dragRotate1)
                        Circle()
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 16, height: 16)
                            .position(x: geometrySize.width/2, y: geometrySize.height/2)
                            .offset(x:geometrySize.width/2)
                            .rotationEffect(.init(degrees: editPicData.editPictureData.colorCircleInf.degrees2))
                            .gesture(dragRotate2)
                        
                    }
                    .onAppear{
                        geometrySize = geometry.size
                    }
                    
                    .onChange(of: editPicData.editPictureData.colorCircleInf.degrees1) { newValue in
                        if (oldDegrees1 + newValue)/2 == degrees180point && abs(oldDegrees1 - newValue) == 24{
                            editPicData.editPictureData.colorCircleInf.countLongWay.toggle()
                        }
                        if oldDegrees1 == editPicData.editPictureData.colorCircleInf.degrees2 {
                            editPicData.editPictureData.colorCircleInf.countLongWay = false
                        }
                        settingTrimColorPoint()
                        oldDegrees1 = newValue
                    }
                    
                    .onChange(of: editPicData.editPictureData.colorCircleInf.degrees2) { newValue in
                        if (oldDegrees2 + newValue)/2 == degrees180point && abs(oldDegrees2 - newValue) == 24 {
                            editPicData.editPictureData.colorCircleInf.countLongWay.toggle()
                        }
                        if oldDegrees2 == editPicData.editPictureData.colorCircleInf.degrees1 {
                            editPicData.editPictureData.colorCircleInf.countLongWay = false
                        }
                        settingTrimColorPoint()
                        oldDegrees2 = newValue
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
