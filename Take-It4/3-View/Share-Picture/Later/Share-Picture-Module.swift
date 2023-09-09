//
//  Share-Picture-Module-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/28.
//

import SwiftUI

struct SharePictureModule: View {
    
//    var pictureInf: PictureInformationStruct = PictureInformationStruct(
//        position: CGSize(width: 200,height: 299),
//        image: "porche2",
//        imageScale: 0.6,
//        time: Date(),
//        comment: "",
//        picturePageInf: PicturePageTitleStruct(title:"porsche911"))
    var backgroundOpacity: Double = 0
    var changeBackground: (CGFloat)->Void
    
    @State var scale: CGFloat = 0
    @State var openCommentView = false
    @State var openLittleProfile = false
    @Binding var openedLittleProfile: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            
            VStack {
                HStack {
                    Button(action:{
                        withAnimation(.linear(duration:0.1)){
                            openLittleProfile = true
                        }
                    }){
                        HStack(spacing:0){
                            Image("porche1")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 42.0)
                            Text("shotaro14722")
                                .font(.system(size: 15))
                                .bold()
                        }
                    }
                    Spacer()
                    Button(action:{}){
                        HStack {
                            Text("#porsche 911")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal,9)
                        .padding(.vertical,6.5)
                    }
                }
                .padding(.horizontal,5)
                .offset(y:3.5)
                
                PinchInOutImage(scale: $scale, picture: "porche1")
                    .zIndex(scale == 0 ? 0 : 10)
                
                HStack(alignment: .top) {
                    HStack {
                        Text("wow this is so great")
                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                            .font(.system(size: 16))
                            .padding(.leading,5)
                            .offset(y: -3)
                        Spacer()
                    }
                    .padding(.horizontal,12)
                    .frame(width: 250)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 22) {
                        HStack(spacing:15) {
                            Button(action:{
                                openCommentView = true
                            }){
                                HStack(spacing:8){
                                    Image(systemName: "ellipsis.message")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.black)
                                        .frame(width: 19.5,height: 19.5)
                                    Text("6")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13.5))
                                }
                            }
                            .sheet(isPresented: $openCommentView) {
                                VStack(spacing:20){
                                    CommentTextFieldView()
                                    CommentArrayView()
                                }
                                .presentationDetents([.medium,.large])
                            }
                            HStack(spacing:8){
                                Button(action:{
                                    
                                }){
                                    Image(systemName: "heart")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.black)
                                        .frame(width: 17,height: 17)
                                }.padding(0)
                                Text(String("12"))
                                    .padding(0)
                                    .font(.system(size: 13))
                                    .offset(y:1)
                            }
                            .padding(.trailing,10)
                        }
                        VStack(alignment: .trailing) {
                            Text(ShowDate(Date()))
                                .font(.system(size: 12.5))
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                .padding(.horizontal,10)
                            Button(action:{}){Text("@shotaro14722")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                    .padding(.trailing,10)
                            }
                        }
                    }
                }.padding(.top,5)
            }
            .frame(height: 460)
            .onChange(of: scale) { newValue in
                changeBackground(scale)
            }
            .zIndex(scale == 0 ? 0 : 10)
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
                .opacity(backgroundOpacity)
                .animation(.linear(duration: 0.2), value: backgroundOpacity)
                .zIndex(1)
            
            if openLittleProfile {
                LittleProfileView()
                    .position(x:175,y:70)
                    .onAppear{
                        openedLittleProfile = true
                    }
                    .onChange(of: openedLittleProfile) { newValue in
                        if openLittleProfile && !newValue{
                            withAnimation(.linear(duration:0.1)){
                                openLittleProfile = false
                            }
                        }
                    }
            }
        }
        .zIndex(scale == 0 ? 0 : 10)
    }
}

//struct Share_Picture_Module_View_Previews: PreviewProvider {
//    static var previews: some View {
//        SharePictureModule()
//    }
//}
