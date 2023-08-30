//
//  Selected-Picture.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/14.
//

import SwiftUI

struct CSelectedPic: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    @State var text = ""
    
    @State var focused2 = false
    @FocusState var focused: Bool
    
    var body: some View {
        ZStack{
            if contInfo.selectedPicInfo != nil {
                
                Image(uiImage: contInfo.selectedPicInfo!.image)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.45)
                    .background(Color.white.opacity(0.95))
                    .clipShape(
                        RoundedRectangle(cornerRadius:
                                            contInfo.selectedPicInfo!.imageWidth/45))
                    .frame(width:contInfo.selectedPicInfo!.imageWidth,
                           height:contInfo.selectedPicInfo!.imageWidth)
                    .animation(.linear(duration: 0.1), value: contInfo.selectedPicInfo!.imageWidth)
                    .onTapGesture {
                        print(32)
                    }
                    .allowsHitTesting(false)
                    .position(
                        x: contInfo.selectedPicInfo!.position.x,
                        y: contInfo.selectedPicInfo!.position.y)
                    .animation(.linear(duration: 0.05), value: contInfo.selectedPicInfo!.position)
                    .saturation(1+contInfo.selectedPicInfo!.num1*1.2)
                    .brightness(-contInfo.selectedPicInfo!.num2*0.12)
                    .contrast(1+contInfo.selectedPicInfo!.num3/9*4)
                    .grayscale(contInfo.selectedPicInfo!.num4*1)
                    .colorMultiply(
                        Color(red: contInfo.selectedPicInfo!.colorArray[0],
                              green: contInfo.selectedPicInfo!.colorArray[1],
                              blue: contInfo.selectedPicInfo!.colorArray[2]))
                
//                if focused2{
//                    TextEditor(text: $text)
//                        .fixedSize(horizontal: true, vertical: true)
//                        .lineLimit(2)
//                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
//                        .font(.system(size: 14))
//                        .focused($focused)
//                        .position(
//                            x: contInfo.selectedPicInfo!.position.x,
//                            y: contInfo.selectedPicInfo!.position.y)
//                        .offset(
//                            y: contInfo.selectedPicInfo!.imageWidth * contInfo.selectedPicInfo!.imageRatio / 2 + 20)
//                        .onChange(of: text) { newValue in
//                            contInfo.selectedPicInfo!.comment = newValue
//                        }
//                        .toolbar{
//                            ToolbarItemGroup(placement: .keyboard){
//                                Spacer()
//                                Button(action: {
//                                    focused = false
//                                    focused2 = false
//                                    if text == "" {
//                                        contInfo.selectedPicInfo!.comment = "..."
//                                    }
//                                }){
//                                    Image(systemName: "arrowshape.right")
//                                        .resizable(resizingMode: .stretch)
//                                        .aspectRatio(contentMode: .fit)
//                                        .foregroundColor(Color.black)
//                                        .frame(width: 25.0)
//                                        .rotationEffect(.degrees(90))
//                                }
//                            }
//                        }
//                } else {
//                    Text("\(contInfo.selectedPicInfo!.comment)")
//                        .frame(width: 175)
//                        .multilineTextAlignment(.center)
//                        .lineLimit(2)
//                        .lineSpacing(-5)
//                        .foregroundColor(.gray)
//                        .font(.system(size: 13))
//                        .padding(30)
//                        .onTapGesture {
//                            focused = true
//                            focused2 = true
//                            if contInfo.selectedPicInfo!.comment != "..." {
//                                text = contInfo.selectedPicInfo!.comment
//                            } else {
//                                text = ""
//                            }
//                        }
//                        .position(
//                            x: contInfo.selectedPicInfo!.position.x,
//                            y: contInfo.selectedPicInfo!.position.y)
//                        .offset(
//                            y: contInfo.selectedPicInfo!.imageWidth * contInfo.selectedPicInfo!.imageRatio / 2 + 20)
//                }
            }
        }
    }
}

//struct Selected_Picture_Previews: PreviewProvider {
//    static var previews: some View {
//        Selected_Picture()
//    }
//}
