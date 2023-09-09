//
//  Picture-Main-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct CContent2: View {
    
    @ObservedObject var folderHandler: FolderHandler
    
    @StateObject var contInfo = ContentInformation()
    @StateObject var editPicData = EditPicData()
    @StateObject var dragData = DragData()
    @StateObject var otherData = COtherData()
    
    @State var openPageMenu = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                
                CollectionHeader(
                    folderHandler: folderHandler,
                    contInfo: contInfo,
                    openPageMenu: $openPageMenu)
                
                CollectionMainView(
                    contInfo: contInfo,
                    editPicData: editPicData,
                    dragData: dragData,
                    otherData: otherData)
                
            }
            .allowsHitTesting(!editPicData.startEdit)
            .blur(radius: editPicData.startEdit ? 5:0)
            .overlay{
                Color.black.opacity(otherData.show1 ? 0.5:0)
                    .ignoresSafeArea()
            }
            .overlay{
                Color.black.opacity(openPageMenu ? 0.3:0)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.15)){
                            openPageMenu = false
                        }
                    }
                    .ignoresSafeArea()
            }
            
            CContentViewZStack(
                folderHandler: folderHandler,
                contInfo: contInfo,
                editPicData: editPicData,
                otherData: otherData,
                openPageMenu: $openPageMenu)
        }
        .onAppear{
            print("onAppear")
        }
        .onChange(of: folderHandler.selectedFolder) { newValue in
            print("onChange")
        }
    }
}

struct PictureMainView_Previews: PreviewProvider {
    static var previews: some View {
        CContent2(folderHandler: FolderHandler())
    }
}
