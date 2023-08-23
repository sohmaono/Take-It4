//
//  Selecting-Font.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/01.
//

import SwiftUI

struct SelectingFont: View {
    
    @ObservedObject var contInfo: ContentInformation
    @Binding var openSelectingFont: Bool
    
    var body: some View {
        if contInfo.selectedTextInfo != nil {
            VStack(spacing:18){
                HStack(spacing: 18){
                    Button {
                        contInfo.selectedTextInfo!.fontType = ""
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("",size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "HoeflerText-Regular"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "HoeflerText-Regular" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("HoeflerText-Regular",size: 15))
                                .foregroundColor(.white)
                                .offset(y:2)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "MarkerFelt-Thin"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "MarkerFelt-Thin" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("MarkerFelt-Thin",size: 17))
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "Noteworthy-Bold"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "Noteworthy-Bold" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("Noteworthy-Bold",size: 15))
                                .foregroundColor(.white)
                                .offset(y:-1)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "SnellRoundhand"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "SnellRoundhand" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("SnellRoundhand",size: 15))
                                .foregroundColor(.white)
                        }
                    }
                }
                HStack(spacing: 18){
                    Button {
                        contInfo.selectedTextInfo!.fontType = "AmericanTypewriter"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "AmericanTypewriter" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("AmericanTypewriter",size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "ChalkboardSE-Regular"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "ChalkboardSE-Regular" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("ChalkboardSE-Regular",size: 15))
                                .foregroundColor(.white)
                            
                                .offset(y:-1)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "BodoniSvtyTwoITCTT-Book"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "BodoniSvtyTwoITCTT-Book" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("BodoniSvtyTwoITCTT-Book",size: 15))
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "Copperplate"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "Copperplate" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("Copperplate",size: 16.5))
                                .foregroundColor(.white)
                                .offset(y:0.5)
                        }
                    }
                    Button {
                        contInfo.selectedTextInfo!.fontType = "Optima-Regular"
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(contInfo.selectedTextInfo!.fontType == "Optima-Regular" ? Color(red: 0/255, green: 0/255, blue: 255/255) : Color(red: 0.3, green: 0.3, blue: 0.3))
                                .opacity(0.5)
                                .frame(width: 45,height: 25)
                            Text("ABC")
                                .font(.custom("Optima-Regular",size: 15))
                                .foregroundColor(.white)
                                .offset(y:0.5)
                        }
                    }
                }
            }
        }
    }
}

//struct Selecting_Font_Previews: PreviewProvider {
//    static var previews: some View {
//        Selecting_Font()
//    }
//}
