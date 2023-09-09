//
//  Selected-Picture.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/09/08.
//

import SwiftUI

struct SSelectedPicture: View {
    
    @ObservedObject var cData: CollectionData
    
    var body: some View {
        if let info = cData.selectedPic{
            VStack{
                Image(uiImage: info.image)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: info.imageWidth/75))
                    .saturation(1+info.num1*1.2)
                    .brightness(-info.num2*0.12)
                    .contrast(1+info.num3/9*4)
                    .grayscale(info.num4*1)
                    .colorMultiply(Color(red: info.colorArray[0], green: info.colorArray[1], blue: info.colorArray[2]))
                    .frame(width: cData.selectedWidth, height: cData.selectedHeight)
                
                HStack{
                    Text(info.comment)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal,30)
                    Spacer()
                    Text(ShowDate(info.time))
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal,30)
                }
            }
        }
    }
}

struct Selected_Picture_Previews: PreviewProvider {
    static var previews: some View {
        SSelectedPicture(cData: CollectionData())
    }
}
