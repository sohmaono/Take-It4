//
//  Clipping-Picture.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/04.
//

import SwiftUI

struct CClippingPicture: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    var tabSelection2: Int
    
    var dragGestureTopLeft: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clipPicData.dragging = true
                if change.location.x >= 0{
                    if editPicData.clipPicData.right - change.location.x >= 60{
                        editPicData.clipPicData.left = CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clipPicData.left =
                        editPicData.clipPicData.right - 60
                    }
                }else{
                    editPicData.clipPicData.left = 0
                }
                if change.location.y >= 0{
                    if editPicData.clipPicData.bottom - change.location.y >= 60{
                        editPicData.clipPicData.top = CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clipPicData.top =
                        editPicData.clipPicData.bottom - 60
                    }
                } else {
                    editPicData.clipPicData.top = 0
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var dragGestureTopRight: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clipPicData.dragging = true
                if change.location.x <= editPicData.clipPicData.geometrySize.width {
                    if change.location.x - editPicData.clipPicData.left >= 60{
                        editPicData.clipPicData.right = CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clipPicData.right =
                        editPicData.clipPicData.left + 60
                    }
                } else {
                    editPicData.clipPicData.right =
                    editPicData.clipPicData.geometrySize.width
                }
                if change.location.y >= 0{
                    if editPicData.clipPicData.bottom - change.location.y >= 60{
                        editPicData.clipPicData.top =
                        CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clipPicData.top =
                        editPicData.clipPicData.bottom - 60
                    }
                } else {
                    editPicData.clipPicData.top = 0
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var dragGestureBottomLeft: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clipPicData.dragging = true
                if change.location.x >= 0{
                    if editPicData.clipPicData.right - change.location.x >= 60{
                        editPicData.clipPicData.left =
                        CGFloat(Int(change.location.x/8))*8
                    } else {
                        editPicData.clipPicData.left =
                        editPicData.clipPicData.right - 60
                    }
                }else{
                    editPicData.clipPicData.left = 0
                }
                if change.location.y <= editPicData.clipPicData.geometrySize.height {
                    if change.location.y - editPicData.clipPicData.top >= 60{
                        editPicData.clipPicData.bottom =
                        CGFloat(Int(change.location.y/8))*8
                    } else {
                        editPicData.clipPicData.bottom =
                        editPicData.clipPicData.top + 60
                    }
                } else {
                    editPicData.clipPicData.bottom =
                    editPicData.clipPicData.geometrySize.height
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var dragGestureBottomRight: some Gesture {
        DragGesture()
            .onChanged { change in
                editPicData.clipPicData.dragging = true
                if change.location.x <= editPicData.clipPicData.geometrySize.width {
                    if change.location.x - editPicData.clipPicData.left >= 60{
                        editPicData.clipPicData.right =
                        CGFloat(Int(change.location.x/15))*15
                    } else {
                        editPicData.clipPicData.right =
                        editPicData.clipPicData.left + 60
                    }
                } else {
                    editPicData.clipPicData.right =
                    editPicData.clipPicData.geometrySize.width
                }
                if change.location.y <= editPicData.clipPicData.geometrySize.height {
                    if change.location.y - editPicData.clipPicData.top >= 60{
                        editPicData.clipPicData.bottom =
                        CGFloat(Int(change.location.y/15))*15
                    } else {
                        editPicData.clipPicData.bottom =
                        editPicData.clipPicData.top + 60
                    }
                } else {
                    editPicData.clipPicData.bottom =
                    editPicData.clipPicData.geometrySize.height
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .frame(
                        width: editPicData.clipPicData.clippedWidth,
                        height: editPicData.clipPicData.geometrySize.height - editPicData.clipPicData.bottom)
                    .position(
                        x:editPicData.clipPicData.widthAverage,
                        y: (editPicData.clipPicData.bottom+editPicData.clipPicData.geometrySize.height)/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clipPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clipPicData.clippedWidth,
                        height: editPicData.clipPicData.top)
                    .position(
                        x: editPicData.clipPicData.widthAverage,
                        y: editPicData.clipPicData.top/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clipPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clipPicData.left,
                        height: editPicData.clipPicData.geometrySize.height)
                    .position(
                        x: editPicData.clipPicData.left/2,
                        y: editPicData.clipPicData.geometrySize.height/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clipPicData.blackOpacity)
                Rectangle()
                    .frame(
                        width: editPicData.clipPicData.geometrySize.width - editPicData.clipPicData.right,
                        height: editPicData.clipPicData.geometrySize.height)
                    .position(
                        x:(editPicData.clipPicData.geometrySize.width + editPicData.clipPicData.right)/2,
                        y: editPicData.clipPicData.geometrySize.height/2)
                    .foregroundColor(.black)
                    .opacity(editPicData.clipPicData.blackOpacity)
                
                if tabSelection2 == 1{
                    Rectangle()
                        .stroke(lineWidth: 1.5)
                        .foregroundColor(Color.white)
                        .frame(width: editPicData.clipPicData.clippedWidth,
                               height: editPicData.clipPicData.clippedHeight)
                        .position(x:editPicData.clipPicData.widthAverage,
                                  y:editPicData.clipPicData.heightAverage)
                    
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
                    .position(x: editPicData.clipPicData.left,
                              y: editPicData.clipPicData.top)
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
                    .position(x: editPicData.clipPicData.right,
                              y: editPicData.clipPicData.top)
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
                    .position(x: editPicData.clipPicData.left,
                              y: editPicData.clipPicData.bottom)
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
                    .position(x: editPicData.clipPicData.right,
                              y: editPicData.clipPicData.bottom)
                    .gesture(dragGestureBottomRight)
                    
                    ZStack{
                        Rectangle()
                            .frame(
                                width: 1,
                                height: editPicData.clipPicData.clippedHeight)
                            .position(
                                x: editPicData.clipPicData.left + editPicData.clipPicData.clippedWidth/3,
                                y: editPicData.clipPicData.heightAverage)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(
                                width: 1,
                                height: editPicData.clipPicData.clippedHeight)
                            .position(x: editPicData.clipPicData.left + editPicData.clipPicData.clippedWidth/3*2,
                                      y: editPicData.clipPicData.heightAverage)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(
                                width: editPicData.clipPicData.clippedWidth,
                                height: 1)
                            .position(
                                x: editPicData.clipPicData.widthAverage,
                                y: editPicData.clipPicData.top + editPicData.clipPicData.clippedHeight/3)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(
                                width: editPicData.clipPicData.clippedWidth,
                                height: 1)
                            .position(
                                x:editPicData.clipPicData.widthAverage,
                                y: editPicData.clipPicData.top + editPicData.clipPicData.clippedHeight/3*2)
                            .foregroundColor(.white)
                    }
                    .opacity(editPicData.clipPicData.graphOpacity)
                    .animation(.linear(duration: 0.4),value:editPicData.clipPicData.graphOpacity)
                }
                
            }
            .onAppear{
                editPicData.clipPicData.bottom = geometry.size.height
                editPicData.clipPicData.right = geometry.size.width
                editPicData.clipPicData.geometrySize = geometry.size
            }
            .onChange(of: editPicData.clipPicData.dragging, perform: { newValue in
                if editPicData.clipPicData.dragging{
                    withAnimation(.linear(duration:0.2)){
                        editPicData.clipPicData.blackOpacity = 0.35
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline:.now()+0.5){
                        withAnimation(.linear(duration:0.2)){
                            editPicData.clipPicData.blackOpacity = 0.7
                        }
                    }
                }
                if editPicData.clipPicData.clippedHeight/editPicData.clipPicData.clippedWidth >= 3/4.5 && editPicData.clipPicData.clippedHeight/editPicData.clipPicData.clippedWidth <= 4.5/3{
                    if editPicData.clipPicData.dragging{
                        editPicData.clipPicData.graphOpacity = 0.5
                    } else {
                        editPicData.clipPicData.graphOpacity = 0.75
                        DispatchQueue.main.asyncAfter(deadline:.now()+0.4){
                            editPicData.clipPicData.graphOpacity = 0.25
                        }
                    }
                } else {
                    editPicData.clipPicData.graphOpacity = 0
                }
            })
            .onChange(
                of: Int(
                    editPicData
                        .clipPicData.top+editPicData
                        .clipPicData.bottom+editPicData
                        .clipPicData.left+editPicData
                        .clipPicData.right)) { newValue in
                            if editPicData.clipPicData.clippedHeight/editPicData
                                .clipPicData.clippedWidth >= 3/4.5 &&
                                editPicData.clipPicData.clippedHeight/editPicData
                                .clipPicData.clippedWidth <= 4.5/3{
                                if editPicData.clipPicData.dragging{
                                    editPicData.clipPicData.graphOpacity = 0.6
                                } else {
                                    editPicData.clipPicData.graphOpacity = 0.25
                                }
                            } else {
                                editPicData.clipPicData.graphOpacity = 0
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
