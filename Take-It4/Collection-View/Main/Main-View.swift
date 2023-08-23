//
//  Picture-Main-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct CollectionMainView: View {
    
    @StateObject var contInfo = ContentInformation()
    @StateObject var editPicData = EditPicData()
    @StateObject var dragData = DragData()
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                CollectionTopButtonView(
                    sheetName: "car",
                    contInfo: contInfo,
                    editPicData: editPicData)
                
                CollectionContentView(
                    contInfo: contInfo,
                    editPicData: editPicData,
                    dragData: dragData)
            }
            .allowsHitTesting(!editPicData.startEditPicture)
            .blur(radius: editPicData.startEditPicture ? 5 : 0)
            
            if editPicData.startEditPicture{
                EditingPicture(
                    contInfo: contInfo,
                    editPicData: editPicData)
            }
        }
    }
}

struct PictureMainView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionMainView()
    }
}
