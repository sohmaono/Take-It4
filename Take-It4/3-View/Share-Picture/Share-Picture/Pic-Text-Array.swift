//
//  SharedPictureArrayView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/25.
//

import SwiftUI

struct SPicTextArray: View {
    
    @ObservedObject var cData: CollectionData
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack{
                    ForEach(cData.picInfoArray) { item in
                        Image(uiImage: item.image)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: item.imageWidth/45))
                            .saturation(1+item.num1*1.2)
                            .brightness(-item.num2*0.12)
                            .contrast(1+item.num3/9*4)
                            .grayscale(item.num4*1)
                            .colorMultiply(Color(red: item.colorArray[0], green: item.colorArray[1], blue: item.colorArray[2]))
                            .onTapGesture {
                                cData.selectPic(item)
                            }
                            .frame(width:item.imageWidth,height:item.imageWidth)
                            .position(
                                x:item.position.x,
                                y:item.position.y)
                    }
                    ForEach(cData.textInfoArray) { item in
                        Text(item.text)
                            .fixedSize(horizontal: true, vertical: false)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .italic(item.italic)
                            .fontWeight(fontWeightArray[item.fontWeight])
                            .kerning(item.lineSpacing)
                            .font(item.fontType != "" ? .custom(item.fontType, size: 50) : .system(size: 50))
                            .scaleEffect(item.fontScale)
                            .padding(25)
                            .position(x: item.position.x, y:item.position.y)
                    }
                }
            }
        }
    }
}


//struct SharedPictureArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedPictureArrayView()
//    }
//}
