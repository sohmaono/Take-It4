//
//  ClipPic-Graph.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct ClipPicGraph: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(
                    width: 1,
                    height: editPicData.clipPicData.clippedHeight)
                .position(
                    x: editPicData.clipPicData.left + editPicData.clipPicData.clippedWidth/3,
                    y: editPicData.clipPicData.heightAverage)
                .foregroundColor(.white)
            Rectangle()
                .frame(
                    width: 1,
                    height: editPicData.clipPicData.clippedHeight)
                .position(x: editPicData.clipPicData.left + editPicData.clipPicData.clippedWidth/3*2,
                          y: editPicData.clipPicData.heightAverage)
                .foregroundColor(.white)
            Rectangle()
                .frame(
                    width: editPicData.clipPicData.clippedWidth,
                    height: 1)
                .position(
                    x: editPicData.clipPicData.widthAverage,
                    y: editPicData.clipPicData.top + editPicData.clipPicData.clippedHeight/3)
                .foregroundColor(.white)
            Rectangle()
                .frame(
                    width: editPicData.clipPicData.clippedWidth,
                    height: 1)
                .position(
                    x:editPicData.clipPicData.widthAverage,
                    y: editPicData.clipPicData.top + editPicData.clipPicData.clippedHeight/3*2)
                .foregroundColor(.white)
        }
        .opacity(editPicData.clipPicData.graphOpacity)
        .animation(.linear(duration: 0.4),value:editPicData.clipPicData.graphOpacity)
    }
}

//struct ClipPic_Graph_Previews: PreviewProvider {
//    static var previews: some View {
//        ClipPicGraph()
//    }
//}
