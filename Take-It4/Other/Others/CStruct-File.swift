//
//  Struct-File.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/02.
//

import SwiftUI

//↓collection

struct ExampleAllInformationStruct{
    var profileInf = ProfileInformationStruct()
    var collectionArray: [FolderInformationStruct] = []
}

struct ProfileInformationStruct{
    var id = UUID()
    var username = "shotaro14722"
    var profileImage = "porche1"
}

struct FolderInformationStruct: Hashable,Identifiable{
    var title = "MyLife"
    var time = Date()
    var id = UUID()
}

struct CollectionInfStruct: Identifiable{
    var titleInf: String
    var pictureInf: [PictureInformationStruct] = []
    var textInf: [TextInformationStruct] = []
    var id = UUID()
    var time = Date()
}

struct PictureInformationStruct: Identifiable{
    var image: UIImage = UIImage(named: "porche1")!
    var position: Position = Position(x:300,y:250)
    var imageWidth: Double = 90
    var num1: Double = 0
    var num2: Double = 0
    var num3: Double = 0
    var num4: Double = 0
    var colorArray: [Double] = [1,1,1]
    var comment: String = "..."
    var time: Date = Date()
    var id: UUID = UUID()
    var likedNum = 0
    var imageRatio: Double = 1
}

struct TextInformationStruct: Identifiable,Codable{
    var text: String
    var position: Position
    var fontScale: Double
    var italic: Bool
    var fontWeight: Int
    var lineSpacing: CGFloat
    var fontType: String
    var id: UUID
}
//↓share

struct CommentStruct: Identifiable{
    var id = UUID()
    var comment: String
    var time = Date()
    var liked = 0
    var userName: String
    var userImage: String
}


