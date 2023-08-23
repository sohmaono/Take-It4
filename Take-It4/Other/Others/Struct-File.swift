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
    var collectionArray: [CollectionInfStruct] = []
}

struct ProfileInformationStruct{
    var id = UUID()
    var username = "shotaro14722"
    var profileImage = "porche1"
}

struct CollectionInfStruct: Identifiable{
    var titleInf: PicturePageTitleStruct
    var pictureInf: [PictureInformationStruct] = []
    var textInf: [TextInformationStruct] = []
    var id = UUID()
}

struct PicturePageTitleStruct{
    var title: String
    var time = Date()
}

struct PictureInformationStruct: Identifiable{
    var image: UIImage
    var position: Position
    var imageWidth: Double
    var num1: Double
    var num2: Double
    var num3: Double
    var num4: Double
    var colorArray: [Double]
    var comment: String
    var time: Date
    var id: UUID
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


