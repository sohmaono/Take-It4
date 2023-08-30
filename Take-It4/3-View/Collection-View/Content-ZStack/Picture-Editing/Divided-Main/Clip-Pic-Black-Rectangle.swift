//
//  Clip-Pic-Black-Rectangle.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct ClipPicBlackRectangle: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(
                    width: editPicData.clipPicData.clippedWidth,
                    height: editPicData.imageFrameHeight - editPicData.clipPicData.bottom)
                .position(
                    x:editPicData.clipPicData.widthAverage,
                    y: (editPicData.clipPicData.bottom+editPicData.imageFrameHeight)/2)
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
                    height: editPicData.imageFrameHeight)
                .position(
                    x: editPicData.clipPicData.left/2,
                    y: editPicData.imageFrameHeight/2)
                .foregroundColor(.black)
                .opacity(editPicData.clipPicData.blackOpacity)
            Rectangle()
                .frame(
                    width: editPicData.imageFrameWidth - editPicData.clipPicData.right,
                    height: editPicData.imageFrameHeight)
                .position(
                    x:(editPicData.imageFrameWidth + editPicData.clipPicData.right)/2,
                    y: editPicData.imageFrameHeight/2)
                .foregroundColor(.black)
                .opacity(editPicData.clipPicData.blackOpacity)
        }
    }
}

//struct Clip_Pic_Black_Rectangle_Previews: PreviewProvider {
//    static var previews: some View {
//        Clip_Pic_Black_Rectangle()
//    }
//}
