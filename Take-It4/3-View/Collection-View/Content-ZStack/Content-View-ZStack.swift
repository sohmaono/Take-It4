//
//  Content-View-ZStack.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/25.
//

import SwiftUI

struct CContentViewZStack: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    @ObservedObject var otherData: COtherData
    
    @Binding var openPageMenu: Bool
    
    var body: some View {
        ZStack{
            CEditingPicture(
                contInfo: contInfo,
                editPicData: editPicData,
                otherData: otherData)
            
            CShow1(
                contInfo: contInfo,
                editPicData: editPicData,
                otherData: otherData)
            
            CPageMenu(openPageMenu: $openPageMenu)
        }
    }
}

//struct Content_View_ZStack_Previews: PreviewProvider {
//    static var previews: some View {
//        Content_View_ZStack()
//    }
//}
