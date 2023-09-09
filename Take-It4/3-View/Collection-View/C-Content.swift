//
//  C-Content.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/09/08.
//

import SwiftUI

struct CContent: View {
    
    @StateObject var folderHandler = FolderHandler()
    
    var body: some View {
        if folderHandler.openNewFolderPage || folderHandler.selectedFolder == nil{
            CNewPageView(folderHandler: folderHandler)
        } else {
            CContent2(folderHandler: folderHandler)
        }
    }
}

struct C_Content_Previews: PreviewProvider {
    static var previews: some View {
        CContent()
    }
}
