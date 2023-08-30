//
//  Collection-Content-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CollectionMainView: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData2
    @ObservedObject var dragData: DragData
    @ObservedObject var otherData: COtherData
    
    @Namespace var nameSpace
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        CollectionLikedPictureNumber()
                    }
                    .padding(4)
                    GeometryReader {
                        geometry in
                        CPicText(
                            contInfo: contInfo,
                            dragData: dragData)
                        .onAppear{
                            if otherData.firstGeometryPosition == 0 {
                                otherData.firstGeometryPosition =
                                geometry.frame(in: .global).minY
                            }
                        }
                        .onChange(of: otherData.toggleAndGetGeometry) { _ in
                            otherData.scrolledLength =
                            otherData.firstGeometryPosition-geometry.frame(in: .global).minY
                        }
                    }
                    .frame(height: contInfo.frameHeight)
                    .clipped()
                    
                    Text("Take-It.")
                        .font(.system(size: 13))
                        .fontWeight(.heavy)
                    
                    FrameHeightButton(contInfo: contInfo)
                }
            }
            .scrollDisabled(contInfo.selectedBool)
            
            if contInfo.selectedBool {
                DeleteEditSave(
                    contInfo: contInfo,
                    editPicData: editPicData)
            }
        }
    }
}

//struct Collection_Content_View_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionContentView()
//    }
//}
