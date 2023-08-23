//
//  PictureViewTopButton.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/21.
//

import SwiftUI

struct CollectionTopButtonView: View {
    
    var sheetName = ""
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    
    @State var openSheet = false
    
    var body: some View {
        VStack(spacing:0){
            Text("Take-It.")
                .font(.system(size: 16))
                .fontWeight(.heavy)
            ZStack{
                HStack(spacing:0){
                    PhotosPickerButton(
                        contInfo: contInfo,
                        editPicData: editPicData)
                    .padding(.horizontal, 15.0)
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        contInfo.saveSelected()
                        editPicData.toggleAndGetGeometry.toggle()
                        DispatchQueue.main.async{
                            contInfo.putTextInfo1(position: Position(
                                x: UIScreen.main.bounds.width/2,
                                y: editPicData.addingGeometryPosition+300))
                        }
                    }){
                        ZStack {
                            Image(systemName: "textformat")
                                .font(.system(size: 28))
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action:{}){
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal,10)
                            .foregroundColor(.black)
                    }
                }
                Button(action: {
                    contInfo.saveSelected()
                    withAnimation(.linear(duration: 0.1)){
                        
                    }
                }){
                    Text("#\(sheetName)")
                        .font(.system(size:30))
                        .italic()
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.bottom,5)
            }
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 2)
        }
        .background(
            Color(red: 0.98, green: 0.98, blue: 0.98)
                .ignoresSafeArea())
    }
}
