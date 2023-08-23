//
//  反省作成class-otherData.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/16.
//

import SwiftUI


class EditPicData: ObservableObject {
    @Published var startEditPicture = false
    @Published var editPictureData = EditPictureData()
    
    @Published var clippingPicData = ClippingPictureData()
    
    func finishEdit(){
        editPictureData.colorCircleInf = ColorCircleStruct(degrees1: 288, degrees2: 288, countLongWay: false)
        editPictureData.comment = ""
        editPictureData.openFilterCircle = false
        editPictureData.forPlusMinusButtonAnimation = false
        editPictureData.openEditingMode = false
        editPictureData.changeEditAddingPicture = false
        editPictureData.num1 = 0
        editPictureData.num2 = 0
        editPictureData.num3 = 0
        editPictureData.num4 = 0
        
        clippingPicData.top = 0
        clippingPicData.bottom = 0
        clippingPicData.left = 0
        clippingPicData.right = 0
        clippingPicData.geometrySize = .zero
        
        clippingPicData.dragging = false
        clippingPicData.graphOpacity = 0
        clippingPicData.blackOpacity = 0.45
    }
    
    @Published var toggleAndGetGeometry = false
    @Published var firstGeometryPosition: CGFloat = 0
    @Published var addingGeometryPosition: CGFloat = 0
    
    @Published var showProgressView = false
}
