//
//  Showing-The-Area-Func.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

fileprivate var hPadding: CGFloat = 20
fileprivate var multipleDrag: CGFloat = 1.2

func CalculateDragAreaFuncPic1(
    contInfo: ContentInformation,
    dragData: DragData){
        
        var picX: CGFloat = 0
        var picY: CGFloat = 0
        let screen = UIScreen.main.bounds.width-hPadding
        var padding = Position(x: 0, y: 0)
        
        
        if contInfo.selectedPicInfo!.imageRatio >= 1 {
            let width = contInfo.selectedPicInfo!.imageWidth
            let height = width / contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        } else {
            let height = contInfo.selectedPicInfo!.imageWidth
            let width = height * contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        }
        
        let dragX = dragData.contentLastPosition.x+(
            dragData.drag1Position.x-dragData.drag1StartLocation.x)*multipleDrag
        let dragY = dragData.contentLastPosition.y+(
            dragData.drag1Position.y-dragData.drag1StartLocation.y)*multipleDrag
        
        if dragX > padding.x && dragX < screen - padding.x {
            picX = dragX
            dragData.showHFrameToggle(false)
        } else if dragX <= padding.x {
            picX = padding.x
            dragData.showHFrameToggle(true)
        } else if dragX > screen - padding.x {
            picX = screen - padding.x
            dragData.showHFrameToggle(true)
        }
        
        if dragY > padding.y && dragY < contInfo.frameHeight - padding.y {
            picY = dragY
            dragData.showTFrameToggle(false)
            dragData.showBFrameToggle(false)
        } else if dragY <= padding.y {
            picY = padding.y
            dragData.showTFrameToggle(true)
        } else if dragY > contInfo.frameHeight - padding.y {
            picY = contInfo.frameHeight - padding.y
            dragData.showBFrameToggle(true)
        }
        
        withAnimation(.linear(duration: 0.05)){
            contInfo.selectedPicInfo!.position = Position(x: picX, y: picY)
        }
    }


func CalculateDragAreaFuncPic2(
    contInfo: ContentInformation,
    dragData: DragData){
        var picX: CGFloat = 0
        var picY: CGFloat = 0
        let screen = UIScreen.main.bounds.width-hPadding
        var padding = Position(x: 0, y: 0)
        
        
        if contInfo.selectedPicInfo!.imageRatio >= 1 {
            let width = contInfo.selectedPicInfo!.imageWidth
            let height = width / contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        } else {
            let height = contInfo.selectedPicInfo!.imageWidth
            let width = height * contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        }
        
        let dragX = dragData.contentLastPosition.x+(
            dragData.drag2Position.x-dragData.drag2StartLocation.x)*multipleDrag
        let dragY = dragData.contentLastPosition.y+(
            dragData.drag2Position.y-dragData.drag2StartLocation.y)*multipleDrag
        
        if dragX > padding.x && dragX < screen - padding.x {
            picX = dragX
            dragData.showHFrameToggle(false)
        } else if dragX <= padding.x {
            picX = padding.x
            dragData.showHFrameToggle(true)
        } else if dragX > screen - padding.x {
            picX = screen - padding.x
            dragData.showHFrameToggle(true)
        }
        
        if dragY > padding.y && dragY < contInfo.frameHeight - padding.y {
            picY = dragY
            dragData.showTFrameToggle(false)
            dragData.showBFrameToggle(false)
        } else if dragY <= padding.y {
            picY = padding.y
            dragData.showTFrameToggle(true)
        } else if dragY >= contInfo.frameHeight - padding.y {
            picY = contInfo.frameHeight - padding.y
            dragData.showBFrameToggle(true)
        }
        
        withAnimation(.linear(duration: 0.05)){
            contInfo.selectedPicInfo!.position = Position(x: picX, y: picY)
        }
    }


func CalculateDragAreaFuncPic3(
    contInfo: ContentInformation,
    dragData: DragData){
        
        var picX: CGFloat = 0
        var picY: CGFloat = 0
        let screen = UIScreen.main.bounds.width-hPadding
        var padding = Position(x: 0, y: 0)
        
        
        if contInfo.selectedPicInfo!.imageRatio >= 1 {
            let width = contInfo.selectedPicInfo!.imageWidth
            let height = width / contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        } else {
            let height = contInfo.selectedPicInfo!.imageWidth
            let width = height * contInfo.selectedPicInfo!.imageRatio
            padding = Position(x: width/2, y: height/2)
        }
        
        let position = dragData.calculatePosition()
        let dragX = position.x
        let dragY = position.y
        
        if dragX > padding.x && dragX < screen - padding.x {
            picX = dragX
            dragData.showHFrameToggle(false)
        } else if dragX <= padding.x {
            picX = padding.x
            dragData.showHFrameToggle(true)
        } else if dragX > screen - padding.x {
            picX = screen - padding.x
            dragData.showHFrameToggle(true)
        }
        
        if dragY > padding.y && dragY < contInfo.frameHeight - padding.y {
            picY = dragY
            dragData.showTFrameToggle(false)
            dragData.showBFrameToggle(false)
        } else if dragY <= padding.y {
            picY = padding.y
            dragData.showTFrameToggle(true)
        } else if dragY >= contInfo.frameHeight - padding.y {
            picY = contInfo.frameHeight - padding.y
            dragData.showBFrameToggle(true)
        }
        
        withAnimation(.linear(duration: 0.05)){
            contInfo.selectedPicInfo!.position = Position(x: picX, y: picY)
        }
    }
