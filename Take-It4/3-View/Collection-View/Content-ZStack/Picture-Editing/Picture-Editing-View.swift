//
//  Editing-Picture-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//
import SwiftUI

struct CEditingPicture: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    @ObservedObject var otherData: COtherData
    
    @State var tabSelection = 1
    @Namespace var nameSpace
    
    var body: some View {
        //
        if contInfo.selectedPicInfo != nil && editPicData.startEdit {
            VStack(spacing:15){
                    PictureEditTopButton(
                        contInfo: contInfo,
                        editPicData: editPicData,
                        otherData: otherData)
                Image(uiImage: contInfo.selectedPicInfo!.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .saturation(1+editPicData.num1*1.2)
                    .brightness(-editPicData.num2*0.12)
                    .contrast(1+editPicData.num3/9*4)
                    .grayscale(editPicData.num4*1)
                    .colorMultiply(Color(
                        red: editPicData.red,
                        green: editPicData.green,
                        blue: editPicData.blue))
                    .overlay{
                        CClippingPicture(
                            editPicData: editPicData,
                            tabSelection: tabSelection)
                    }
                    .frame(
                        width: editPicData.imageFrameWidth,
                        height: editPicData.imageFrameHeight)
                    .onTapGesture {
                        tabSelection = 1
                    }
                CPictureEditTabView(
                    contInfo: contInfo,
                    editPicData: editPicData,
                    tabSelection: $tabSelection)
            }
            .padding(.horizontal,5)
            .padding(15)
            .background{
                Color(red: 0.95, green: 0.95, blue: 0.95)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15,style:.continuous))
            .shadow(radius: 10)
            .padding(30)
        }
    }
}

struct PictureMainViewwww_Previews: PreviewProvider {
    static var previews: some View {
        CEditingPicture(
            contInfo: ContentInformation(),
            editPicData: EditPicData(),
        otherData: COtherData())
    }
}
