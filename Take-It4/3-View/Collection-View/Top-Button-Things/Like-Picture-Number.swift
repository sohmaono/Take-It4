//
//  Like-Picture-Number.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/21.
//

import SwiftUI

struct CollectionLikedPictureNumber: View {
    var body: some View {
        VStack (spacing: 0){
            HStack(spacing:15){
                Spacer()
                HStack(spacing:7){
                    Image(systemName: "heart.fill")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(.gray)
                        .frame(width: 15, height: 12)
                    Text("12")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
                HStack(spacing:7){
                    Image(systemName: "photo")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(.gray)
                        .frame(width: 16.5, height: 14)
                    Text("15")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }
            .padding(8)
            Spacer()
        }
    }
}
//
//struct Like_Picture_Number_Previews: PreviewProvider {
//    static var previews: some View {
//        LikedPictureNumber()
//    }
//}
