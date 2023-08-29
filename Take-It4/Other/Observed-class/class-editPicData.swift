//
//  反省作成class-otherData.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/16.
//

import SwiftUI


class EditPicData: ObservableObject {
    
    @Published var show1 = false
    @Namespace var nameSpace
    @Published var rotate = false
    
    @Published var openPicker = false
    
    @Published var startEditPicture = false
    @Published var editPictureData = EditPictureData()
    
    @Published var clippingPicData = ClippingPictureData()
    
    func finishEdit(){
        editPictureData = EditPictureData()
        clippingPicData = ClippingPictureData()
    }
    
    @Published var toggleAndGetGeometry = false
    @Published var firstGeometryPosition: CGFloat = 0
    @Published var addingGeometryPosition: CGFloat = 0
    
    @Published var showProgressView = false
}
