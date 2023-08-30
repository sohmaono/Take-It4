//
//  Pic-Drag-Handler.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct CPicDragHandler: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    var addX:CGFloat = 0
    var addY:CGFloat = 0
    
    var a:Double = 2
    var b:CGFloat = 2
    
    var gesture1: some Gesture{
        DragGesture(minimumDistance: 3)
            .onChanged { value in
                dragData.drag1Position = Position(
                    x: Double(Int((value.location.x+addX)*b))/a,
                    y: Double(Int((value.location.y+addY)*b))/a)
                
                if !dragData.drag1Started{
                    if !dragData.drag2Started{
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    dragData.drag1StartLocation = Position(
                        x: value.startLocation.x+addX,
                        y: value.startLocation.y+addY)
                    dragData.contentLastPosition = contInfo.selectedPicInfo!.position
                    
                    dragData.drag2StartLocation = dragData.drag2Position
                    dragData.contentLastWidth = contInfo.selectedPicInfo!.imageWidth
                    dragData.drag1Started = true
                    dragData.firstTwoFingerDistance =
                    (pow((dragData.drag2Position.x-value.startLocation.x-addX), 2)+pow((value.startLocation.y+addY-dragData.drag2Position.y), 2)).squareRoot()
                }
                
                if !dragData.drag2Started {
                    CalculateDragAreaFuncPic1(contInfo: contInfo, dragData: dragData)
                }
            }
            .onEnded { _ in
                dragData.drag1Started = false
                dragData.showGesture2 = false
                dragData.contentLastPosition = contInfo.selectedPicInfo!.position
                dragData.drag2StartLocation = dragData.drag2Position
            }
    }
    
    var gesture2: some Gesture{
        DragGesture(minimumDistance: 3)
            .onChanged { value in
                
                dragData.drag2Position = Position(
                    x: Double(Int((value.location.x+addX)*b))/a,
                    y: Double(Int((value.location.y+addY)*b))/a)
                
                if !dragData.drag2Started{
                    if !dragData.drag1Started{
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    dragData.drag2StartLocation = Position(
                        x: value.startLocation.x+addX,
                        y: value.startLocation.y+addY)
                    dragData.contentLastPosition = contInfo.selectedPicInfo!.position
                    
                    dragData.drag1StartLocation = dragData.drag1Position
                    dragData.contentLastWidth = contInfo.selectedPicInfo!.imageWidth
                    dragData.firstTwoFingerDistance =
                    (pow((dragData.drag1Position.x-value.startLocation.x-addX), 2)+pow((value.startLocation.y+addY-dragData.drag1Position.y), 2)).squareRoot()
                    dragData.drag2Started = true
                    dragData.showGesture2 = false
                }
                
                if !dragData.drag1Started{
                    CalculateDragAreaFuncPic2(contInfo: contInfo, dragData: dragData)
                }
            }
            .onEnded { _ in
                dragData.showGesture2 = true
                dragData.drag2Started = false
                dragData.contentLastPosition = contInfo.selectedPicInfo!.position
                dragData.drag1StartLocation = dragData.drag1Position
            }
    }
    
    var gesture3: some Gesture{
        LongPressGesture(minimumDuration: 0)
            .onEnded { _ in
                dragData.showGesture2 = true
            }
    }
    
    var combined:some Gesture{
        gesture3.sequenced(before: gesture1)
    }
    
    var body: some View{
        ZStack {
            if contInfo.selectedPicInfo != nil{
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.001)
                    .gesture(combined)
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.001)
                    .gesture(gesture2)
                    .zIndex(dragData.showGesture2 ? 10 : -10)
            }
        }
        .onChange(of: dragData.drag1Position.x+dragData.drag1Position.y+dragData.drag2Position.x+dragData.drag2Position.y) { _ in
            if dragData.drag2Started && dragData.drag1Started {
                contInfo.selectedPicInfo!.imageWidth = dragData.calculateWidth()
                CalculateDragAreaFuncPic3(contInfo: contInfo, dragData: dragData)
            }
        }
    }
}
