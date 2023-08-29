//
//  Editing-Picture-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//
import SwiftUI

struct CEditingPicture: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData2
    
    @State var tabSelection = 0
    @State var tabSelection2 = 0
    @Namespace var nameSpace
    
    var body: some View {
        
        if contInfo.selectedPicInfo != nil && editPicData.startEdit {
            VStack {
                HStack{
                    Button(action:{}){
                        HStack{
                            Image(systemName: "arrow.left")
                            Text("Back")
                        }
                        .bold()
                        .foregroundColor(.black)
                    }
                    Spacer()
                    Button(action:{
                        contInfo.selectedPicInfo!.num1 = editPicData.num1
                        contInfo.selectedPicInfo!.num2 = editPicData.num2
                        contInfo.selectedPicInfo!.num3 = editPicData.num3
                        contInfo.selectedPicInfo!.num4 = editPicData.num4
                        contInfo.selectedPicInfo!.colorArray =
                        [editPicData.red,editPicData.green,editPicData.blue]
                        contInfo.selectedPicInfo!.comment = editPicData.caption
                        editPicData.startEdit = false
                        DispatchQueue.main.async{
                            if let image = cropImage(
                                contInfo.selectedPicInfo!.image,
                                Position(x: editPicData.clipPicData.clippedWidth,
                                         y: editPicData.clipPicData.clippedHeight),
                                Position(x: editPicData.clipPicData.left,
                                         y: editPicData.clipPicData.top),
                                300){
                                contInfo.selectedPicInfo!.image = image
                            }
                        }
                    }){
                        Image(systemName: "xmark")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .bold()
                            .frame(width: 16.0)
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical,5)
                .padding(.horizontal,15)
                Image(uiImage: contInfo.selectedPicInfo!.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay{
                        CClippingPicture(
                            editPicData: editPicData,
                            tabSelection2: tabSelection2)
                    }
                    .frame(width: 300,height: 300)
                    .saturation(1+editPicData.num1*1.2)
                    .brightness(-editPicData.num2*0.12)
                    .contrast(1+editPicData.num3/9*4)
                    .grayscale(editPicData.num4*1)
                    .colorMultiply(Color(
                        red: editPicData.red,
                        green: editPicData.green,
                        blue: editPicData.blue))
                    .background{
                        Color.black
                    }
                    .onTapGesture {
                        tabSelection = 1
                    }
                ZStack(alignment:.top){
                    TabView(selection: $tabSelection) {
                        CEditTab1(editPicData: editPicData).tag(0)
                        CEditTab2(editPicData: editPicData).tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: tabSelection) { newValue in
                        withAnimation(.linear(duration: 0.2)){
                            tabSelection2 = newValue
                        }
                    }
                    .frame(height:200)
                    .padding(.top,30)
                    
                    HStack(spacing: 30){
                        Button(action:{tabSelection = 0}){
                            VStack(spacing:5){
                                Image(systemName: "signpost.left.fill")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(tabSelection2 == 0 ? .blue:.gray)
                                    .frame(width: 22.0)
                                    .bold(tabSelection2 == 0)
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 4)
                                    .foregroundColor(.gray)
                                    .overlay{
                                        if tabSelection2 == 0{
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(height: 4)
                                                .foregroundColor(.blue)
                                                .matchedGeometryEffect(id: "CEditTab", in: nameSpace)
                                        }
                                    }
                            }
                        }
                        Button(action:{tabSelection = 1}){
                            VStack(spacing:5){
                                Image(systemName: tabSelection2 == 1 ? "drop.fill":"drop")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(tabSelection2 == 1 ? .blue:.gray)
                                    .frame(width: 16.0)
                                    .bold(tabSelection2 == 1)
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 4)
                                    .foregroundColor(.gray)
                                    .overlay{
                                        if tabSelection2 == 1{
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(height: 4)
                                                .foregroundColor(.blue)
                                                .matchedGeometryEffect(id: "CEditTab", in: nameSpace)
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal,40)
                }//
            }
            .onAppear{
                if let data = contInfo.selectedPicInfo {
                    editPicData.num1 = data.num1
                    editPicData.num2 = data.num2
                    editPicData.num3 = data.num3
                    editPicData.num4 = data.num4
                    editPicData.red = data.colorArray[0]
                    editPicData.green = data.colorArray[1]
                    editPicData.blue = data.colorArray[2]
                    editPicData.caption = data.comment
                }
            }
            .background{
                Color.white.opacity(0.8)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(
                width: UIScreen.main.bounds.width*0.9,
                height: UIScreen.main.bounds.height*0.7)
        }
    }
}

struct PictureMainViewwww_Previews: PreviewProvider {
    static var previews: some View {
        CEditingPicture(contInfo: ContentInformation(), editPicData: EditPicData2())
    }
}
