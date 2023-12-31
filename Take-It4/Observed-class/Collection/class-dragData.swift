//
//  反省作成class-dragData.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/16.
//

import SwiftUI

fileprivate var multipleDrag: CGFloat = 1.2

class DragData: ObservableObject {
    
    @Published var drag1Started = false
    @Published var drag1Position = Position(x: 0, y: 0)
    @Published var drag1StartLocation = Position(x: 0, y: 0)
    
    @Published var drag2Started = false
    @Published var drag2Position = Position(x: 0, y: 0)
    @Published var drag2StartLocation = Position(x: 0, y: 0)
    
    @Published var contentPosition = Position(x: 0, y: 0)
    @Published var contentLastPosition = Position(x: 0, y: 0)
    
    @Published var contentLastWidth: Double = 0
    
    @Published var contentLastScale: Double = 0
    
    @Published var firstTwoFingerDistance: Double = 0
    
    @Published var showGesture2 = false
    
    func calculatePosition()->Position{
        Position(
            x: contentLastPosition.x + (
                drag2Position.x-drag2StartLocation.x+drag1Position.x-drag1StartLocation.x)/2*multipleDrag,
            y: contentLastPosition.y + (
                drag2Position.y-drag2StartLocation.y+drag1Position.y-drag1StartLocation.y)/2*multipleDrag)
    }
    
    func calculateFontScale()->Double{
        var scale = (Double((pow((drag1Position.x-drag2Position.x),2) + pow((drag1Position.y-drag2Position.y),2))).squareRoot()/firstTwoFingerDistance-1)*1.3+contentLastScale
        if scale >= 0.55 {
            scale = 0.55
        } else if scale <= 0.3 {
            scale = 0.3
        }
        return scale
    }
    
    func calculateWidth()->Double{
        var width = (Double((pow((drag1Position.x-drag2Position.x),2) + pow((drag1Position.y-drag2Position.y),2))).squareRoot()-firstTwoFingerDistance)*1.3+contentLastWidth
        if width >= 200 {
            width = 200
        } else if width <= 90{
            width = 90
        }
        return width
    }
    
    func reset(){
        drag1Started = false
        drag1Position = Position(x: 0, y: 0)
        drag1StartLocation = Position(x: 0, y: 0)
        drag2Started = false
        drag2Position = Position(x: 0, y: 0)
        drag2StartLocation = Position(x: 0, y: 0)
        contentPosition = Position(x: 0, y: 0)
        contentLastPosition = Position(x: 0, y: 0)
        contentLastWidth = 0
        contentLastScale = 0
        firstTwoFingerDistance = 0
        showGesture2 = false
    }
    
    @Published var showTFrame = false
    @Published var showBFrame = false
    @Published var showHFrame = false
    
    func showTFrameToggle(_ bool: Bool){
        var sec: Double
        if bool{
            sec = 0.5
        } else {
            sec = 0.15
        }
        if showTFrame != bool {
            if !showTFrame{
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            withAnimation(.easeOut(duration: sec).delay(0.1)){
                showTFrame.toggle()
            }
        }
    }
    func showBFrameToggle(_ bool: Bool){
        var sec: Double
        if bool{
            sec = 0.5
        } else {
            sec = 0.15
        }
        if showBFrame != bool {
            if !showBFrame{
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            withAnimation(.easeOut(duration: sec).delay(0.1)){
                showBFrame.toggle()
            }
        }
    }
    func showHFrameToggle(_ bool: Bool){
        if showHFrame != bool{
            if !showHFrame{
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            showHFrame.toggle()
        }
    }
}
