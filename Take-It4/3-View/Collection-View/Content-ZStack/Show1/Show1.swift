//
//  Show1.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/24.
//

import SwiftUI
import PhotosUI

struct CShow1: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    @ObservedObject var otherData: COtherData
    
    @State var selectedPic: PhotosPickerItem? = nil
    @State var rotate = false
    @State var showBackCircle = false
    
    @Namespace var nameSpace
    
    var body: some View {
        ZStack{
            if otherData.show1{
                VStack(spacing:15){
                    Spacer()
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                            Button(action:{
                                otherData.show1toggle(0.3)
                                withAnimation(.linear(duration: 0.5)){
                                    rotate = false
                                }
                            }){
                                Image(systemName: "plus")
                                    .font(.system(size: 21))
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,15)
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                                    .rotationEffect(.degrees(rotate ? -45 : 0))
                                    .background{
                                        Circle()
                                            .foregroundColor(.white)
                                            .opacity(showBackCircle ? 0.4:0)
                                    }
                            }
                            .matchedGeometryEffect(id: "CollectionPlusButton", in: nameSpace)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    VStack(spacing:12){
                        PhotosPickerButton(
                            otherData: otherData)
                        
                        Rectangle()
                            .frame(width: 140, height: 2)
                            .opacity(0.4)
                        
                        TextAddButton(
                            contInfo: contInfo,
                            otherData: otherData)
                    }
                    .padding(.horizontal,18)
                    .padding(.top,21)
                    .padding(.bottom,15)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 10)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            } else {
                HStack {
                    VStack {
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal,15)
                            .foregroundColor(.black)
                            .opacity(0.8)
                            .rotationEffect(.degrees(rotate ? -45 : 0))
                            .matchedGeometryEffect(id: "CollectionPlusButton", in: nameSpace)
                            .onTapGesture {
                                contInfo.saveSelected()
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.15){
                                    self.otherData.show1toggle(0.25)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                    withAnimation(.easeOut(duration: 0.3)){
                                        self.showBackCircle = true
                                    }
                                }
                                withAnimation(.easeOut(duration:0.2)){
                                    rotate = true
                                }
                            }
                            .onAppear{
                                rotate = false
                                showBackCircle = false
                            }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .photosPicker(isPresented: $otherData.openPicker,selection: $selectedPic, matching: .images)
        .onChange(of: selectedPic) { newValue in
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            editPicData.startedFromPicker = true
            otherData.toggleAndGetGeometry.toggle()
            if let newValue {
                Task.detached {
                    guard let imageData = try? await newValue.loadTransferable(type: Data.self) else {
                        return
                    }
                    await MainActor.run{
                        if let selectedImage = UIImage(data: imageData){
                            var ratio = selectedImage.size.width/selectedImage.size.height
                            var finalImage = selectedImage
                            if ratio > 1.6 {
                                if let image = cropImage(
                                    selectedImage,
                                    Position(x: selectedImage.size.height*1.6,
                                             y: selectedImage.size.height),
                                    Position(x: (selectedImage.size.width-selectedImage.size.height*1.6)/2, y: 0),
                                    selectedImage.size.width,selectedImage.size.height){
                                    finalImage = image
                                    ratio = 1.6
                                }
                            } else if ratio < 1/1.6{
                                if let image = cropImage(
                                    selectedImage,
                                    Position(x: selectedImage.size.width,
                                             y: selectedImage.size.width*1.6),
                                    Position(x: 0,
                                             y: (selectedImage.size.height-selectedImage.size.width*1.6)/2),
                                    selectedImage.size.width,selectedImage.size.height){
                                    finalImage = image
                                    ratio = 1/1.6
                                }
                            }
                            contInfo.putPicInfo1(
                                pic: finalImage,
                                position: .init(
                                    x: UIScreen.main.bounds.width/2,
                                    y: otherData.scrolledLength+300),
                                imageRatio: ratio)
                            
                            if let data = contInfo.selectedPicInfo {
                                EditStartingFunc(data, editPicData)
                            }
                        }
                    }
                }
            }
        }
    }
}
