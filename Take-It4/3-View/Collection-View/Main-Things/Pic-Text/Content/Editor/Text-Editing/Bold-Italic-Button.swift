//
//  Bold-Italic-Button.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/01.
//

import SwiftUI

var fontWeightArray: [Font.Weight] = [.heavy,.bold,.semibold,.regular,.light,.thin]

struct BoldItalicButton: View {
    
    @ObservedObject var contInfo: ContentInformation
    
    @Binding var openSelectingFont: Bool
    
    var body: some View {
        HStack(spacing:10){
            HStack(spacing:0){
                Button(action:{
                    contInfo.selectedTextInfo!.italic.toggle()
                }){
                    ZStack{
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 25,height:25)
                        Image(systemName: "italic")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 10.5,height:10.5)
                    }
                }
                Button(action:{
                    if !(contInfo.selectedTextInfo!.fontWeight <= 0){
                        contInfo.selectedTextInfo!.fontWeight -= 1
                    } else {
                        contInfo.selectedTextInfo!.fontWeight = 5
                    }
                }){
                    ZStack{
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 25,height:25)
                        Image(systemName: "bold")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 10,height:10)
                    }
                }
            }
            HStack(spacing:0){
                Button(action:{
                    if contInfo.selectedTextInfo!.lineSpacing > 0{
                        contInfo.selectedTextInfo!.lineSpacing -= 1
                    }else{
                        contInfo.selectedTextInfo!.lineSpacing = 0
                    }
                }){
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(7/9, contentMode: .fit)
                        .frame(width: 12.5)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .padding(3)
                }
                Button(action:{contInfo.selectedTextInfo!.lineSpacing = 0}){
                    ZStack{
                        Circle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 25,height:25)
                        Image(systemName: "space")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 16,height:16)
                    }.padding(1)
                }
                Button(action:{
                    if contInfo.selectedTextInfo!.lineSpacing < 10{
                        contInfo.selectedTextInfo!.lineSpacing += 1
                    }else{
                        contInfo.selectedTextInfo!.lineSpacing = 10
                    }
                }){
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(7/9, contentMode: .fit)
                        .frame(width: 12.5)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .padding(3)
                }
            }
        }
        Button(action:{openSelectingFont.toggle()}){
            ZStack{
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(width: 25,height:25)
                Image(systemName: "f.cursive")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 10.5,height:10.5)
            }
        }
    }
}

//struct Bold_Italic_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        BoldItalicButton()
//    }
//}
