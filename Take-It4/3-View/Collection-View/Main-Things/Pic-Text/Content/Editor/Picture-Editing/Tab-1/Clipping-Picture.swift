//
//  Clipping-Picture.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/04.
//

import SwiftUI

struct ClippingPicture: View {
    
    @ObservedObject var editPicData: EditPicData
    
    var dragGestureTopLeft: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clippingPicData.dragging = true
                if change.location.x >= 0{
                    if editPicData.clippingPicData.right - change.location.x >= 60{
                        editPicData.clippingPicData.left = CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clippingPicData.left =
                        editPicData.clippingPicData.right - 60
                    }
                }else{
                    editPicData.clippingPicData.left = 0
                }
                if change.location.y >= 0{
                    if editPicData.clippingPicData.bottom - change.location.y >= 60{
                        editPicData.clippingPicData.top = CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clippingPicData.top =
                        editPicData.clippingPicData.bottom - 60
                    }
                } else {
                    editPicData.clippingPicData.top = 0
                }
            }
            .onEnded { change in
                editPicData.clippingPicData.dragging = false
            }
    }
    
    var dragGestureTopRight: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clippingPicData.dragging = true
                if change.location.x <= editPicData.clippingPicData.geometrySize.width {
                    if change.location.x - editPicData.clippingPicData.left >= 60{
                        editPicData.clippingPicData.right = CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clippingPicData.right =
                        editPicData.clippingPicData.left + 60
                    }
                } else {
                    editPicData.clippingPicData.right =
                    editPicData.clippingPicData.geometrySize.width
                }
                if change.location.y >= 0{
                    if editPicData.clippingPicData.bottom - change.location.y >= 60{
                        editPicData.clippingPicData.top =
                        CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clippingPicData.top =
                        editPicData.clippingPicData.bottom - 60
                    }
                } else {
                    editPicData.clippingPicData.top = 0
                }
            }
            .onEnded { change in
                editPicData.clippingPicData.dragging = false
            }
    }
    
    var dragGestureBottomLeft: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clippingPicData.dragging = true
                if change.location.x >= 0{
                    if editPicData.clippingPicData.right - change.location.x >= 60{
                        editPicData.clippingPicData.left =
                        CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clippingPicData.left =
                        editPicData.clippingPicData.right - 60
                    }
                }else{
                    editPicData.clippingPicData.left = 0
                }
                if change.location.y <= editPicData.clippingPicData.geometrySize.height {
                    if change.location.y - editPicData.clippingPicData.top >= 60{
                        editPicData.clippingPicData.bottom =
                        CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clippingPicData.bottom =
                        editPicData.clippingPicData.top + 60
                    }
                } else {
                    editPicData.clippingPicData.bottom =
                    editPicData.clippingPicData.geometrySize.height
                }
            }
            .onEnded { change in
                editPicData.clippingPicData.dragging = false
            }
    }
    
    var dragGestureBottomRight: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clippingPicData.dragging = true
                if change.location.x <= editPicData.clippingPicData.geometrySize.width {
                    if change.location.x - editPicData.clippingPicData.left >= 60{
                        editPicData.clippingPicData.right =
                        CGFloat(Int(change.location.x/15))*15
                    } else {
                        editPicData.clippingPicData.right =
                        editPicData.clippingPicData.left + 60
                    }
                } else {
                    editPicData.clippingPicData.right =
                    editPicData.clippingPicData.geometrySize.width
                }
                if change.location.y <= editPicData.clippingPicData.geometrySize.height {
                    if change.location.y - editPicData.clippingPicData.top >= 60{
                        editPicData.clippingPicData.bottom =
                        CGFloat(Int(change.location.y/15))*15
                    } else {
                        editPicData.clippingPicData.bottom =
                        editPicData.clippingPicData.top + 60
                    }
                } else {
                    editPicData.clippingPicData.bottom =
                    editPicData.clippingPicData.geometrySize.height
                }
            }
            .onEnded { change in
                editPicData.clippingPicData.dragging = false
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .frame(
                        width: editPicData.clippingPicData.clippedWidth,
                        height: editPicData.clippingPicData.geometrySize.height - editPicData.clippingPicData.bottom)
                    .position(
                        x:editPicData.clippingPicData.widthAverage,
                        y: (editPicData.clippingPicData.bottom+editPicData.clippingPicData.geometrySize.height)/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clippingPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clippingPicData.clippedWidth,
                        height: editPicData.clippingPicData.top)
                    .position(
                        x: editPicData.clippingPicData.widthAverage,
                        y: editPicData.clippingPicData.top/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clippingPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clippingPicData.left,
                        height: editPicData.clippingPicData.geometrySize.height)
                    .position(
                        x: editPicData.clippingPicData.left/2,
                        y: editPicData.clippingPicData.geometrySize.height/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clippingPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clippingPicData.geometrySize.width - editPicData.clippingPicData.right,
                        height: editPicData.clippingPicData.geometrySize.height)
                    .position(
                        x:(editPicData.clippingPicData.geometrySize.width + editPicData.clippingPicData.right)/2,
                        y: editPicData.clippingPicData.geometrySize.height/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clippingPicData.blackOpacity)
                
                
                Rectangle()
                    .stroke(lineWidth: 1.5)
                    .foregroundColor(Color.white)
                    .frame(width: editPicData.clippingPicData.clippedWidth,
                           height: editPicData.clippingPicData.clippedHeight)
                    .position(x:editPicData.clippingPicData.widthAverage,
                              y:editPicData.clippingPicData.heightAverage)
                
                
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 12)
                    Circle()
                        .foregroundColor(.black)
                        .frame(width:6)
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(width:11)
                        .padding(20)
                }
                .padding(35)
                .background(Color.white.opacity(0.01))
                .position(x: editPicData.clippingPicData.left,
                          y: editPicData.clippingPicData.top)
                .gesture(dragGestureTopLeft)
                
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 12)
                    Circle()
                        .foregroundColor(.black)
                        .frame(width:6)
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(width:11)
                        .padding(20)
                }
                .padding(35)
                .background(Color.white.opacity(0.01))
                .position(x: editPicData.clippingPicData.right,
                          y: editPicData.clippingPicData.top)
                .gesture(dragGestureTopRight)
                
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 12)
                    Circle()
                        .foregroundColor(.black)
                        .frame(width:6)
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(width:11)
                        .padding(20)
                }
                .padding(35)
                .background(Color.white.opacity(0.01))
                .position(x: editPicData.clippingPicData.left,
                          y: editPicData.clippingPicData.bottom)
                .gesture(dragGestureBottomLeft)
                
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 12)
                    Circle()
                        .foregroundColor(.black)
                        .frame(width:6)
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(width:11)
                        .padding(20)
                }
                .background(Color.white.opacity(0.01))
                .padding(35)
                .position(x: editPicData.clippingPicData.right,
                          y: editPicData.clippingPicData.bottom)
                .gesture(dragGestureBottomRight)
                
                ZStack{
                    Rectangle()
                        .frame(
                            width: 1,
                            height: editPicData.clippingPicData.clippedHeight)
                        .position(
                            x: editPicData.clippingPicData.left + editPicData.clippingPicData.clippedWidth/3,
                            y: editPicData.clippingPicData.heightAverage)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(
                            width: 1,
                            height: editPicData.clippingPicData.clippedHeight)
                        .position(x: editPicData.clippingPicData.left + editPicData.clippingPicData.clippedWidth/3*2,
                                  y: editPicData.clippingPicData.heightAverage)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(
                            width: editPicData.clippingPicData.clippedWidth,
                            height: 1)
                        .position(
                            x: editPicData.clippingPicData.widthAverage,
                            y: editPicData.clippingPicData.top + editPicData.clippingPicData.clippedHeight/3)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(
                            width: editPicData.clippingPicData.clippedWidth,
                            height: 1)
                        .position(
                            x:editPicData.clippingPicData.widthAverage,
                            y: editPicData.clippingPicData.top + editPicData.clippingPicData.clippedHeight/3*2)
                        .foregroundColor(.white)
                }
                .opacity(editPicData.clippingPicData.graphOpacity)
                .animation(.linear(duration: 0.4),value:editPicData.clippingPicData.graphOpacity)
            }
            .onAppear{
                editPicData.clippingPicData.bottom = geometry.size.height
                editPicData.clippingPicData.right = geometry.size.width
                editPicData.clippingPicData.geometrySize = geometry.size
            }
            .onChange(of: editPicData.clippingPicData.dragging, perform: { newValue in
                if editPicData.clippingPicData.dragging{
                    withAnimation(.linear(duration:0.2)){
                        editPicData.clippingPicData.blackOpacity = 0.35
                    }
                } else {
                        DispatchQueue.main.asyncAfter(deadline:.now()+0.5){
                            withAnimation(.linear(duration:0.2)){
                                editPicData.clippingPicData.blackOpacity = 0.7
                            }
                        }
                    }
                if editPicData.clippingPicData.clippedHeight/editPicData.clippingPicData.clippedWidth >= 3/4.5 && editPicData.clippingPicData.clippedHeight/editPicData.clippingPicData.clippedWidth <= 4.5/3{
                    if editPicData.clippingPicData.dragging{
                        editPicData.clippingPicData.graphOpacity = 0.5
                    } else {
                        editPicData.clippingPicData.graphOpacity = 0.75
                        DispatchQueue.main.asyncAfter(deadline:.now()+0.4){
                            editPicData.clippingPicData.graphOpacity = 0.25
                        }
                    }
                } else {
                    editPicData.clippingPicData.graphOpacity = 0
                }
            })
            .onChange(
                of: Int(
                    editPicData
                        .clippingPicData.top+editPicData
                        .clippingPicData.bottom+editPicData
                        .clippingPicData.left+editPicData
                        .clippingPicData.right)) { newValue in
//                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            if editPicData.clippingPicData.clippedHeight/editPicData
                                .clippingPicData.clippedWidth >= 3/4.5 &&
                                editPicData.clippingPicData.clippedHeight/editPicData
                                .clippingPicData.clippedWidth <= 4.5/3{
                                if editPicData.clippingPicData.dragging{
                                    editPicData.clippingPicData.graphOpacity = 0.6
                    } else {
                        editPicData.clippingPicData.graphOpacity = 0.25
                    }
                } else {
                    editPicData.clippingPicData.graphOpacity = 0
                }
            }
        }
    }
}
//
//struct Clipping_Picture_Previews: PreviewProvider {
//    static var previews: some View {
//        Clipping_Picture()
//    }
//}
