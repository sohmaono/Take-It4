//
//  ShowDateView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/25.
//

import SwiftUI

func ShowDate(_ time: Date)->String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    let dateString = formatter.string(from: time)
    return dateString
}

func ShowDate2(_ time: Date)->String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm"
    let dateString = formatter.string(from: time)
    return dateString
}

func ShowDate3(_ time: Date)->String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let dateString = formatter.string(from: time)
    return dateString
}

func cropImage(_ image:UIImage,_ size: Position,_ position: Position,_ width:CGFloat)->UIImage?{
    var cropSizeX: Double = 0
    var cropSizeY: Double = 0
    var cropPositionX: Double = 0
    var cropPositionY: Double = 0
    if image.size.width >= image.size.height {
        let height = image.size.height/image.size.width*width
        cropSizeX = size.x/width*image.size.width
        cropSizeY = size.y/height*image.size.height
        cropPositionX = position.x/width*image.size.width
        cropPositionY = position.y/height*image.size.height
    } else {
        let width2 = image.size.width/image.size.height*width
        cropSizeX = size.x/width2*image.size.width
        cropSizeY = size.y/width*image.size.height
        cropPositionX = position.x/width2*image.size.width
        cropPositionY = position.y/width*image.size.height
    }
    let cropZone = CGRect(x: cropPositionX, y: cropPositionY, width: cropSizeX, height: cropSizeY)
    guard let cgImage = image.correctlyOriented().cgImage?.cropping(to: cropZone) else {
        return nil}
    return UIImage(cgImage: cgImage)
}

extension UIImage {
    func correctlyOriented() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        let normalizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return normalizedImage ?? self
    }
}
