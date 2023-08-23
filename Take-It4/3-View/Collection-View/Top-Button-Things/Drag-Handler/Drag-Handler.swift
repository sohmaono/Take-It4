//
//  Compose-Drag-Handler.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CollectionDragHandler: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    var addX:CGFloat = 0
    var addY:CGFloat = 0
    
    var body: some View {
        if contInfo.selectedPicInfo != nil {
            CollectionPicDragHandler(
                contInfo: contInfo,
                dragData: dragData,
                addX:addX,
                addY:addY)
        } else if contInfo.selectedTextInfo != nil {
            CollectionTextDragHandler(
                contInfo: contInfo,
                dragData: dragData,
                addX:addX,
                addY:addY)
        }
    }
}

//struct Compose_Drag_Handler_Previews: PreviewProvider {
//    static var previews: some View {
//        Compose_Drag_Handler()
//    }
//}
