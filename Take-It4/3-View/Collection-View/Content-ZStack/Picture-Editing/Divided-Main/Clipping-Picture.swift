//
//  Clipping-Picture.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/04.
//

import SwiftUI

struct CClippingPicture: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    var tabSelection: Int
    
    @State var openClipper = true
    
    @State var lastLeft: CGFloat = 0
    @State var lastRight: CGFloat = 0
    @State var lastTop: CGFloat = 0
    @State var lastBottom: CGFloat = 0
    
    var dragGestureTopLeft: some Gesture {
        return DragGesture()
            .onChanged { change in
                if !editPicData.clipPicData.dragging{
                    editPicData.clipPicData.dragging = true
                    lastLeft = editPicData.clipPicData.left
                    lastTop = editPicData.clipPicData.top
                }
                let left = lastLeft + change.translation.width
                let top = lastTop + change.translation.height
                
                if left >= 0{
                    if editPicData.clipPicData.right - left >= 60{
                        editPicData.clipPicData.left = CGFloat(Int(left/8))*8
                    } else {
                        editPicData.clipPicData.left =
                        editPicData.clipPicData.right - 60
                    }
                }else{
                    editPicData.clipPicData.left = 0
                }
                if top >= 0{
                    if editPicData.clipPicData.bottom - top >= 60{
                        editPicData.clipPicData.top = CGFloat(Int(top/8))*8
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
                if !editPicData.clipPicData.dragging{
                    editPicData.clipPicData.dragging = true
                    lastRight = editPicData.clipPicData.right
                    lastTop = editPicData.clipPicData.top
                }
                
                let right = lastRight + change.translation.width
                let top = lastTop + change.translation.height
                
                if right <= editPicData.imageFrameWidth {
                    if right - editPicData.clipPicData.left >= 60{
                        editPicData.clipPicData.right = CGFloat(Int(right/8))*8
                    } else {
                        editPicData.clipPicData.right =
                        editPicData.clipPicData.left + 60
                    }
                } else {
                    editPicData.clipPicData.right =
                    editPicData.imageFrameWidth
                }
                if top >= 0{
                    if editPicData.clipPicData.bottom - top >= 60{
                        editPicData.clipPicData.top =
                        CGFloat(Int(top/8))*8
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
                if !editPicData.clipPicData.dragging{
                    editPicData.clipPicData.dragging = true
                    lastBottom = editPicData.clipPicData.bottom
                    lastLeft = editPicData.clipPicData.left
                }
                let bottom = lastBottom + change.translation.height
                let left = lastLeft + change.translation.width
                
                if left >= 0{
                    if editPicData.clipPicData.right - left >= 60{
                        editPicData.clipPicData.left =
                        CGFloat(Int(left/8))*8
                    } else {
                        editPicData.clipPicData.left =
                        editPicData.clipPicData.right - 60
                    }
                }else{
                    editPicData.clipPicData.left = 0
                }
                
                if bottom <= editPicData.imageFrameHeight {
                    if bottom - editPicData.clipPicData.top >= 60{
                        editPicData.clipPicData.bottom =
                        CGFloat(Int(bottom/8))*8
                    } else {
                        editPicData.clipPicData.bottom =
                        editPicData.clipPicData.top + 60
                    }
                } else {
                    editPicData.clipPicData.bottom =
                    editPicData.imageFrameHeight
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var dragGestureBottomRight: some Gesture {
        DragGesture()
            .onChanged { change in
                if !editPicData.clipPicData.dragging{
                    editPicData.clipPicData.dragging = true
                    lastRight = editPicData.clipPicData.right
                    lastBottom = editPicData.clipPicData.bottom
                }
                let right = lastRight + change.translation.width
                let bottom = lastBottom + change.translation.height
                
                if right <= editPicData.imageFrameWidth {
                    if right - editPicData.clipPicData.left >= 60{
                        editPicData.clipPicData.right =
                        CGFloat(Int(right/8))*8
                    } else {
                        editPicData.clipPicData.right =
                        editPicData.clipPicData.left + 60
                    }
                } else {
                    editPicData.clipPicData.right =
                    editPicData.imageFrameWidth
                }
                if bottom <= editPicData.imageFrameHeight {
                    if bottom - editPicData.clipPicData.top >= 60{
                        editPicData.clipPicData.bottom =
                        CGFloat(Int(bottom/8))*8
                    } else {
                        editPicData.clipPicData.bottom =
                        editPicData.clipPicData.top + 60
                    }
                } else {
                    editPicData.clipPicData.bottom =
                    editPicData.imageFrameHeight
                }
            }
            .onEnded { change in
                editPicData.clipPicData.dragging = false
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ClipPicBlackRectangle(editPicData: editPicData)
                
                if openClipper{
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
                    }
                    .position(x: editPicData.clipPicData.left,
                              y: editPicData.clipPicData.top)
                    
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
                    }
                    .position(x: editPicData.clipPicData.right,
                              y: editPicData.clipPicData.top)
                    
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
                    }
                    .position(x: editPicData.clipPicData.left,
                              y: editPicData.clipPicData.bottom)
                    
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
                    }
                    .position(x: editPicData.clipPicData.right,
                              y: editPicData.clipPicData.bottom)
                    
                    ClipPicGraph(editPicData: editPicData)
                    
                    VStack(spacing:0){
                        HStack(spacing:0){
                            Rectangle()
                                .opacity(0.01)
                                .gesture(dragGestureTopLeft)
                            Rectangle()
                                .opacity(0.01)
                                .gesture(dragGestureTopRight)
                        }
                        HStack(spacing:0){
                            Rectangle()
                                .opacity(0.01)
                                .gesture(dragGestureBottomLeft)
                            Rectangle()
                                .opacity(0.01)
                                .gesture(dragGestureBottomRight)
                        }
                    }
                }
            }
            .onChange(of: tabSelection, perform: { newValue in
                openClipper = newValue == 1
            })
            .onChange(of: editPicData.clipPicData.dragging, perform: {
                newValue in
                if newValue {
                    withAnimation(.linear(duration:0.2)){
                        editPicData.clipPicData.blackOpacity = 0.35
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline:.now()+0.5){
                        withAnimation(.linear(duration:0.2)){
                            editPicData.clipPicData.blackOpacity = 0.85
                        }
                    }
                }
                let ratio =
                editPicData.clipPicData.clippedHeight/editPicData.clipPicData.clippedWidth
                if ratio >= 3/4.5 && ratio <= 4.5/3{
                    if newValue{
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
            .onChange(of: Int(editPicData
                .clipPicData.top+editPicData
                .clipPicData.bottom+editPicData
                .clipPicData.left+editPicData
                .clipPicData.right)) { newValue in
                    let ratio = editPicData.clipPicData.clippedHeight/editPicData.clipPicData.clippedWidth
                    if ratio >= 3/4.5 &&
                        ratio <= 4.5/3{
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
