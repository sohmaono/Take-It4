//
//  Collection-Content-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CollectionMainView: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    @ObservedObject var dragData: DragData
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    GeometryReader {
                        geometry in
                        CollectionPicText(
                            contInfo: contInfo,
                            dragData: dragData,
                            editPicData: editPicData)
                            .onAppear{
                                if editPicData.firstGeometryPosition == 0 {
                                    editPicData.firstGeometryPosition =
                                    geometry.frame(in: .global).minY
                                }
                            }
                            .onChange(of: editPicData.toggleAndGetGeometry) { _ in
                                editPicData.addingGeometryPosition =
                                editPicData.firstGeometryPosition-geometry.frame(in: .global).minY
                            }
                    }
                    .frame(height: contInfo.frameHeight)
                    .background(Color.white)
                    .clipped()
                    
                    FrameHeightButton(contInfo: contInfo)
                }
            }
            .scrollDisabled(contInfo.selectedBool)
        }
    }
}

//struct Collection_Content_View_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionContentView()
//    }
//}
