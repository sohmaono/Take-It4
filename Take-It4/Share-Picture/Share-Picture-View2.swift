//
//  SharedPictureView2.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/25.
//

import SwiftUI

struct SharedPictureView: View {
    
//    var textInformationArray: [TextInformation] = []
//    var pictureLocationArray: [PictureLocationStruct] = []
//    @State var selectedPicture: PictureLocationStruct?
    @State var blurRadius: Double = 0
    
    var body: some View{
        GeometryReader{ geometry in
//            ZStack{
//                ZStack{
//                    SharedPictureArrayView(
//                        pictureLocationArray: pictureLocationArray,
//                        selectedPicture: $selectedPicture,
//                        blurRadius: $blurRadius)
//                    SharedTextArrayView(
//                        textInformationArray: textInformationArray)
//                }
//                .blur(radius: blurRadius)
//
//                if let pic = selectedPicture{
//                    Rectangle()
//                        .ignoresSafeArea(.all)
//                        .foregroundColor(.gray)
//                        .opacity(0.1)
//                        .onTapGesture {
//                            withAnimation(.easeOut(duration: 0.1)){
//                                selectedPicture = nil
//                                blurRadius = 0
//                            }
//                        }
//                    VStack{
//                        Spacer()
//                        Image(pic.image)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(RoundedRectangle(cornerRadius: 3))
//                            .padding()
//                            .shadow(radius: 12)
//                        HStack(alignment:.top){
//                            Text(ShowDate(pic.time))
//                                .font(.system(size: 17))
//                                .foregroundColor(.gray)
//                                .padding(.horizontal)
//                            Spacer()
//                            Text("\(pic.comment)")
//                                .font(.system(size: 17))
//                                .foregroundColor(.gray)
//                                .padding(.horizontal)
//                        }
//                        Spacer()
//                    }
//                }
//            }
        }
    }
}

struct SharedPictureView_Previews: PreviewProvider {
    static var previews: some View {
        SharedPictureView()
    }
}
