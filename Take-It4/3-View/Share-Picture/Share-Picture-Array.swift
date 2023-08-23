//
//  SharedPictureArrayView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/25.
//

import SwiftUI

struct SharedPictureArrayView: View {
    
//    var pictureLocationArray: [PictureLocationStruct]
//    @Binding var selectedPicture: PictureLocationStruct?
    @Binding var blurRadius: Double
    
    var body: some View {
        ZStack{
//            ForEach(pictureLocationArray) { item in
//                Image(item.image)
//                    .resizable(resizingMode:.stretch)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width/1.5)
//                    .scaleEffect(item.imageScale)
//                    .clipShape(RoundedRectangle(cornerRadius: 3))
//                    .position(x:item.position.width,y:item.position.height)
//                    .onTapGesture {
//                        withAnimation(.easeOut(duration:0.1)){
//                            selectedPicture = item
//                            blurRadius = 3
//                        }
//                    }
//            }
        }
    }
}

//struct SharedPictureArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedPictureArrayView()
//    }
//}

//struct Previews_SharedPictureArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        Text("Hello, World!")
//    }
//}
