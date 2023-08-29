//
//  Clipping-Picture-BlackRectangle.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

//import SwiftUI
//
//struct ClippingPictureBlackRectangle: View {
//    
//    @ObservedObject var editPicData: EditPicData2
//    
//    var body: some View {
//        ZStack{
//            Rectangle()
//                .frame(
//                    width: editPicData.clipPicData.clippedWidth,
//                    height: editPicData.clipPicData.geometrySize.height - editPicData.clipPicData.bottom)
//                .position(
//                    x:editPicData.clipPicData.widthAverage,
//                    y: (editPicData.clipPicData.bottom+editPicData.clipPicData.geometrySize.height)/2)
//                .foregroundColor(.black)
//                .opacity(editPicData.clipPicData.blackOpacity)
//            Rectangle()
//                .frame(
//                    width: editPicData.clipPicData.clippedWidth,
//                    height: editPicData.clipPicData.top)
//                .position(
//                    x: editPicData.clipPicData.widthAverage,
//                    y: editPicData.clipPicData.top/2)
//                .foregroundColor(.black)
//                .opacity(editPicData.clipPicData.blackOpacity)
//            Rectangle()
//                .frame(
//                    width: editPicData.clipPicData.left,
//                    height: editPicData.clipPicData.geometrySize.height)
//                .position(
//                    x: editPicData.clipPicData.left/2,
//                    y: editPicData.clipPicData.geometrySize.height/2)
//                .foregroundColor(.black)
//                .opacity(editPicData.clipPicData.blackOpacity)
//            Rectangle()
//                .frame(
//                    width: editPicData.clipPicData.geometrySize.width - editPicData.clipPicData.right,
//                    height: editPicData.clipPicData.geometrySize.height)
//                .position(
//                    x:(editPicData.clipPicData.geometrySize.width + editPicData.clipPicData.right)/2,
//                    y: editPicData.clipPicData.geometrySize.height/2)
//                .foregroundColor(.black)
//                .opacity(editPicData.clipPicData.blackOpacity)
//            
//            Rectangle()
//                .stroke(lineWidth: 1.5)
//                .foregroundColor(Color.white)
//                .frame(width: editPicData.clipPicData.clippedWidth,
//                       height: editPicData.clipPicData.clippedHeight)
//                .position(x:editPicData.clipPicData.widthAverage,
//                          y:editPicData.clipPicData.heightAverage)
//            
//        }
//    }
//}
//
//struct Clipping_Picture_BlackRectangle_Previews: PreviewProvider {
//    static var previews: some View {
//        Clipping_Picture_BlackRectangle()
//    }
//}
