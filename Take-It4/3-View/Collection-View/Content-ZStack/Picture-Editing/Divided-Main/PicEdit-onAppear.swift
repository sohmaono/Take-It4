//
//  PicEdit-onAppear.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

func EditStartingFunc(
    _ data:PictureInformationStruct,
    _ editPicData:EditPicData){
        editPicData.num1 = data.num1
        editPicData.num2 = data.num2
        editPicData.num3 = data.num3
        editPicData.num4 = data.num4
        editPicData.red = data.colorArray[0]
        editPicData.green = data.colorArray[1]
        editPicData.blue = data.colorArray[2]
        editPicData.caption = data.comment
        
        if data.imageRatio >= 1 {
            editPicData.imageFrameHeight = editPicData.maxFrame/data.imageRatio
            editPicData.imageFrameWidth = editPicData.maxFrame
        } else {
            editPicData.imageFrameWidth = editPicData.maxFrame*data.imageRatio
            editPicData.imageFrameHeight = editPicData.maxFrame
        }
        
        editPicData.startClipPic()
        withAnimation(.easeOut(duration: 0.1)){
            editPicData.startEdit = true
        }
    }
