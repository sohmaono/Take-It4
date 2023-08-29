//
//  PhotosPicker-Button.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/20.
//

import SwiftUI
import PhotosUI

struct PhotosPickerButton: View {
    @ObservedObject var otherData: COtherData
    
    var body: some View {
        Button(action:{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.35){
                self.otherData.openPicker = true
            }
            otherData.show1toggle(0.2)
        }){
            HStack(spacing:12){
                Image(systemName: "photo")
                    .font(.system(size: 23))
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                Text("Add Picture")
                    .font(.system(size: 14.5))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
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
