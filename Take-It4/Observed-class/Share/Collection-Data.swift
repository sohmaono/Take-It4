//
//  SwiftUIView.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/09/08.
//

import SwiftUI

class CollectionData: ObservableObject {
    @Published var picInfoArray: [PictureInformationStruct] = []
    @Published var textInfoArray: [TextInformationStruct] = []
    @Published var frameHeight: CGFloat = 0
    
    func getArray(_ info: ContentInformation){
        picInfoArray = info.picInfoArray
        textInfoArray = info.textInfoArray
        frameHeight = info.frameHeight
    }
    
    func selectPic(_ info: PictureInformationStruct){
        
        let ratio = info.imageRatio
        let max = UIScreen.main.bounds.width - 80
        let total = max*max/1.8
        
        if 1.8 > ratio && ratio > 1/1.8 {
            selectedHeight = sqrt(total/ratio)
            selectedWidth = sqrt(total*ratio)
        } else if ratio >= 1.8 {
            selectedWidth = max
            selectedHeight = max / ratio
        } else {
            selectedHeight = max
            selectedWidth = max * ratio
        }
        
        withAnimation(.easeOut(duration: 0.2)){
            selectedPic = info
        }
    }
    
    @Published var selectedPic: PictureInformationStruct?
    @Published var selectedWidth: CGFloat = 0
    @Published var selectedHeight: CGFloat = 0
    
    var picSelected: Bool{
        selectedPic != nil
    }
}
