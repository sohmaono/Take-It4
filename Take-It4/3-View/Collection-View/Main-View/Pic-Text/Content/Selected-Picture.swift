//
//  Selected-Picture.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/14.
//

import SwiftUI

struct CSelectedPic: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    @State var captionOffset: CGFloat = 0
    
    var body: some View {
        
        if contInfo.selectedPicInfo != nil {
            ZStack{
                Image(uiImage: contInfo.selectedPicInfo!.image)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.45)
                    .background(Color.white.opacity(0.95))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: contInfo.selectedPicInfo!.imageWidth/45))
                    .frame(width:contInfo.selectedPicInfo!.imageWidth,
                           height:contInfo.selectedPicInfo!.imageWidth)
                    .animation(
                        .linear(duration: 0.1),
                        value: contInfo.selectedPicInfo!.imageWidth)
                    .allowsHitTesting(false)
                    .position(
                        x: contInfo.selectedPicInfo!.position.x,
                        y: contInfo.selectedPicInfo!.position.y)
                    .animation(.linear(duration: 0.05),
                               value: contInfo.selectedPicInfo!.position)
                    .saturation(1+contInfo.selectedPicInfo!.num1*1.2)
                    .brightness(-contInfo.selectedPicInfo!.num2*0.12)
                    .contrast(1+contInfo.selectedPicInfo!.num3/9*4)
                    .grayscale(contInfo.selectedPicInfo!.num4*1)
                    .colorMultiply(
                        Color(red: contInfo.selectedPicInfo!.colorArray[0],
                              green: contInfo.selectedPicInfo!.colorArray[1],
                              blue: contInfo.selectedPicInfo!.colorArray[2]))
                
                Text(
                    contInfo.selectedPicInfo!.comment != "" ? contInfo
                        .selectedPicInfo!.comment:"...")
                    .font(.system(size: 9+contInfo.selectedPicInfo!.imageWidth*4/250))
                    .foregroundColor(.gray)
                    .opacity(0.7)
                    .position(
                        x: contInfo.selectedPicInfo!.position.x,
                        y: contInfo.selectedPicInfo!.position.y)
                    .offset(y: contInfo.selectedPicInfo!.imageWidth*captionOffset+15)
                    .animation(
                        .linear(duration: 0.05),
                        value: contInfo.selectedPicInfo!.imageWidth)
                    .animation(.linear(duration: 0.05),
                               value: contInfo.selectedPicInfo!.position)
            }
            .onAppear{
                if contInfo.selectedPicInfo!.imageRatio <= 1{
                    captionOffset = 1/2
                } else {
                    captionOffset = 1/contInfo.selectedPicInfo!.imageRatio
                }
            }
        }
    }
}

//struct Selected_Picture_Previews: PreviewProvider {
//    static var previews: some View {
//        Selected_Picture()
//    }
//}
