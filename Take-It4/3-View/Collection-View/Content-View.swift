//
//  Picture-Main-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct CollectionContentView: View {
    
    @StateObject var contInfo = ContentInformation()
    @StateObject var editPicData = EditPicData2()
    @StateObject var dragData = DragData()
    @StateObject var otherData = COtherData()
    
    @State var openPageMenu = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                
                CollectionHeader(
                    contInfo: contInfo,
                    openPageMenu: $openPageMenu,
                    e: editPicData)
                
                CollectionMainView(
                    contInfo: contInfo,
                    editPicData: editPicData,
                    dragData: dragData,
                    otherData: otherData)
                
            }
            .allowsHitTesting(!editPicData.startEdit)
            .blur(radius: editPicData.startEdit ? 5:0)
            .overlay{
                Color.black.opacity(otherData.show1 ? 0.3:0)
                    .ignoresSafeArea()
            }
            .overlay{
                Color.black.opacity(openPageMenu ? 0.18:0)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.15)){
                            openPageMenu = false
                        }
                    }
                    .ignoresSafeArea()
            }
            
            CContentViewZStack(
                contInfo: contInfo,
                editPicData: editPicData,
                otherData: otherData,
                openPageMenu: $openPageMenu)
        }
    }
}

struct PictureMainView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionContentView()
    }
}
