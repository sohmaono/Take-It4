//
//  Content.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CollectionPicText: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    @ObservedObject var editPicData: EditPicData
    
    var body: some View {
        ZStack {
            CollectionDragHandler(
                contInfo: contInfo,
                dragData: dragData)
            
            CollectionPictureArray(
                contInfo: contInfo,
                dragData: dragData)
            CollectionTextArray(
                contInfo: contInfo,
                dragData: dragData)
            
            if contInfo.selectedPicInfo != nil {
                CollectionSelectedPicture(
                    contInfo: contInfo,
                    dragData: dragData)
            } else if contInfo.selectedTextInfo != nil {
                CollectionSelectedText(
                    contInfo: contInfo,
                    dragData: dragData)
            }
            
            if contInfo.selectedBool {
                DeleteEditSave(
                    contInfo: contInfo,
                    editPicData: editPicData)
            }
        }
    }
}
//
//struct Content_Previews: PreviewProvider {
//    static var previews: some View {
//        Content()
//    }
//}
