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
    @ObservedObject var otherData: COtherData
    
    @Namespace var nameSpace
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10){
                    
                    HStack{
                        Spacer()
                        CollectionLikedPictureNumber(contInfo: contInfo)
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
                    .overlay{
                        Color("CMainFrameShowing")
                            .opacity(dragData.showBFrame ? 0.1:0)
                            .allowsHitTesting(false)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal,10)
                    .frame(height: contInfo.frameHeight)
                    .clipped()
                    
                    FrameHeightButton(contInfo: contInfo)
                }
            }
            
            .scrollDisabled(contInfo.selectedBool)
            
            DeleteEditSave(
                contInfo: contInfo,
                editPicData: editPicData,
                dragData: dragData)
        }
    }
}

//struct Collection_Content_View_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionContentView()
//    }
//}
