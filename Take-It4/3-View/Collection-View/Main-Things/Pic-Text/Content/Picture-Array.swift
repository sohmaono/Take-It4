//
//  PictureArrayView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/21.
//
import SwiftUI

struct CollectionPictureArray: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    var body: some View {
        ZStack{
            ForEach(contInfo.picInfoArray) { info in
                ZStack {
                    Image(uiImage: info.image)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
//                        .overlay{
//                            CollectionDragHandler(contInfo: contInfo, dragData: dragData)
//                                .simultaneousGesture(TapGesture().onEnded{
//                                    if !(dragData.drag1Started || dragData.drag2Started){
//                                        contInfo.saveSelected()
//                                        DispatchQueue.main.async{
//                                            contInfo.putPicInfo2(item: info)
//                                        }
//                                    }
//                                })
//                        }
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: info.imageWidth/45))
                        .saturation(1+info.num1*0.3)
                        .brightness(-info.num2*0.03)
                        .contrast(1+info.num3/9)
                        .grayscale(info.num4*0.25)
                        .colorMultiply(Color(red: info.colorArray[0], green: info.colorArray[2], blue: info.colorArray[1]))
                        .onTapGesture {
                            contInfo.saveSelected()
                            DispatchQueue.main.async{
                                contInfo.putPicInfo2(item: info)
                            }
                    }
                    CollectionDragHandler(
                        contInfo: contInfo,
                        dragData: dragData,
                        addX: info.position.x,
                        addY: info.position.y)
                        .simultaneousGesture(TapGesture().onEnded{
                            print(32)
                            if !(dragData.drag1Started || dragData.drag2Started){
                                contInfo.saveSelected()
                                DispatchQueue.main.async{
                                    contInfo.putPicInfo2(item: info)
                                }
                            }
                        })
                }
                .frame(width:info.imageWidth,height:info.imageWidth)
                .position(
                    x:info.position.x,
                    y:info.position.y)
            }
        }
    }
}
