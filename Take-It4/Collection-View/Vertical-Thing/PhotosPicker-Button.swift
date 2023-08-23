//
//  PhotosPicker-Button.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/20.
//

import SwiftUI
import PhotosUI

struct PhotosPickerButton: View {
    
    @State var openPicker = false
    @State var selectedPic: PhotosPickerItem? = nil
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    
    var body: some View {
        VStack {
            Button(action:{
                openPicker = true
                contInfo.saveSelected()
            }){
                Image(systemName: "photo.circle.fill")
                    .font(.system(size: 40))
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
            .photosPicker(isPresented: $openPicker,selection: $selectedPic, matching: .images)
        }
        .onChange(of: selectedPic) { newValue in
            editPicData.showProgressView = true
            editPicData.startEditPicture = true
            editPicData.toggleAndGetGeometry.toggle()
            if let newValue {
                Task.detached {
                    guard let imageData = try? await newValue.loadTransferable(type: Data.self) else {
                        return
                    }
                    await MainActor.run{
                        if let selectedImage = UIImage(data: imageData){
                            let ratio = selectedImage.size.width/selectedImage.size.height
                            var finalImage = selectedImage
                            if ratio > 1.6 {
                                if let image = cropImage(
                                    selectedImage,
                                    Position(x: selectedImage.size.height*1.6,
                                             y: selectedImage.size.height),
                                    Position(x: (selectedImage.size.width-selectedImage.size.height*1.6)/2, y: 0),
                                    selectedImage.size.width){
                                    finalImage = image
                                }
                            } else if ratio < 1/1.6{
                                if let image = cropImage(
                                selectedImage,
                                Position(x: selectedImage.size.width,
                                         y: selectedImage.size.width*1.6),
                                Position(x: 0,
                                         y: (selectedImage.size.height-selectedImage.size.width*1.6)/2),
                                selectedImage.size.height){
                                    finalImage = image
                                }
                            }
                            contInfo.putPicInfo1(
                                pic: finalImage,
                                position: .init(
                                    x: UIScreen.main.bounds.width/2,
                                    y: editPicData.addingGeometryPosition+300))
                            editPicData.showProgressView = false
                        }
                    }
                }
            }
        }
    }
}
//
//struct PhotosPicker_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosPickerButton()
//    }
//}
