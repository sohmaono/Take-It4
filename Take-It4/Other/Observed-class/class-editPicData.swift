//
//  class-editPic2.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

import SwiftUI

class EditPicData: ObservableObject {
    @Published var startEdit = false
    @Published var startedFromPicker = false
    
    @Published var num1: Double = 0
    @Published var num2: Double = 0
    @Published var num3: Double = 0
    @Published var num4: Double = 0
    
    @Published var red: Double = 1
    @Published var green: Double = 1
    @Published var blue: Double = 1
    
    @Published var caption = ""
    
    @Published var imageFrameHeight: CGFloat = 0
    @Published var imageFrameWidth: CGFloat = 0
    var maxFrame: CGFloat = 240
    
    @Published var clipPicData = ClippingPictureData()
    @Published var filterCircleData = CFilterCircleData()
    
    func startClipPic(){
        clipPicData.top = 0
        clipPicData.left = 0
        clipPicData.bottom = imageFrameHeight
        clipPicData.right = imageFrameWidth
    }
    
    func resetFilterCircleData(){
        filterCircleData = CFilterCircleData()
        DispatchQueue.main.async{
            self.red = 1
            self.green = 1
            self.blue = 1
        }
    }
    
    func finishEdit(){
        num1 = 0
        num2 = 0
        num3 = 0
        num4 = 0
        red = 1
        green = 1
        blue = 1
        imageFrameHeight = 0
        imageFrameWidth = 0
        caption = ""
        filterCircleData = CFilterCircleData()
        clipPicData = ClippingPictureData()
    }
}

