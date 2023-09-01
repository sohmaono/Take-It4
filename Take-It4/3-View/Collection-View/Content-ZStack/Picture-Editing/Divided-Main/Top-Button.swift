//
//  PictureEditXMark.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct PictureEditTopButton: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    @ObservedObject var otherData: COtherData
    
    var body: some View {
        HStack{
            Button(action:{
                if editPicData.startedFromPicker {
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
                        otherData.openPicker = true
                    }
                    withAnimation(.easeOut(duration: 0.2)){
                        editPicData.startEdit = false
                        contInfo.selectedPicInfo = nil
                        editPicData.startedFromPicker = false
                        editPicData.finishEdit()
                    }
                } else {
                    withAnimation(.easeOut(duration: 0.2)){
                        editPicData.startEdit = false
                        editPicData.finishEdit()
                    }
                }
            }){
                HStack{
                    Image(systemName: "arrow.left")
                    Text("Back")
                }
                .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action:{
                contInfo.selectedPicInfo!.num1 = editPicData.num1
                contInfo.selectedPicInfo!.num2 = editPicData.num2
                contInfo.selectedPicInfo!.num3 = editPicData.num3
                contInfo.selectedPicInfo!.num4 = editPicData.num4
                contInfo.selectedPicInfo!.colorArray =
                [editPicData.red,editPicData.green,editPicData.blue]
                contInfo.selectedPicInfo!.comment = editPicData.caption
                DispatchQueue.main.async{
                    if let image = cropImage(
                        contInfo.selectedPicInfo!.image,
                        Position(x: editPicData.clipPicData.clippedWidth,
                                 y: editPicData.clipPicData.clippedHeight),
                        Position(x: editPicData.clipPicData.left,
                                 y: editPicData.clipPicData.top),
                        editPicData.imageFrameWidth,
                        editPicData.imageFrameHeight){
                        contInfo.selectedPicInfo!.image = image
                        contInfo.selectedPicInfo!.imageRatio =
                        editPicData.clipPicData.clippedWidth/editPicData.clipPicData.clippedHeight
                        editPicData.startEdit = false
                        editPicData.startedFromPicker = false
                        editPicData.finishEdit()
                    }
                }
            }){
                if editPicData.startedFromPicker{
                    HStack{
                        Text("Add")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                } else {
                    Text("Done")
                        .foregroundColor(.black)
                        .bold()
                    //                    Image(systemName: "xmark")
                    //                        .resizable(resizingMode: .stretch)
                    //                        .aspectRatio(contentMode: .fit)
                    //                    //                    .bold()
                    //                        .frame(width: 14.0)
                    //                        .foregroundColor(.black)
                    //                        .padding(.horizontal,8)
                }
            }
        }
    }
}
//
//struct PictureEditXMark_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureEditXMark()
//    }
//}
