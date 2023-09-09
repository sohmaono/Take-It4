//
//  class-FolderHandler.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/09/02.
//

import SwiftUI

class FolderHandler: ObservableObject {
    
    @Published var folderArray: [FolderInformationStruct] = []
    
    @Published var selectedFolder: FolderInformationStruct?
    @Published var openNewFolderPage = false
    
    func addFolder(_ folder: FolderInformationStruct){
        folderArray.append(folder)
        selectedFolder = folder
        openNewFolderPage = false
    }
}
