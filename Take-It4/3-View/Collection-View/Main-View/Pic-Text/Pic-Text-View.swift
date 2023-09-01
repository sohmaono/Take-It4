//
//  Content.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CPicText: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    var body: some View {
        ZStack{
            
            CDragHandler(
                contInfo: contInfo,
                dragData: dragData)
            
            CPitureArray(
                contInfo: contInfo,
                dragData: dragData)
            CTextArray(
                contInfo: contInfo,
                dragData: dragData)
            
            if contInfo.selectedPicInfo != nil {
                CSelectedPic(
                    contInfo: contInfo,
                    dragData: dragData)
            } else if contInfo.selectedTextInfo != nil {
                CSelectedText(
                    contInfo: contInfo,
                    dragData: dragData)
                
            }
        }
        .onDisappear{
            contInfo.saveSelected()
        }
    }
}
//
//struct Content_Previews: PreviewProvider {
//    static var previews: some View {
//        Content()
//    }
//}
