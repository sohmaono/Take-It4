//
//  SharePictureHomeView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/27.
//

import SwiftUI

struct SharePictureHomeView: View {
    
    @State var deviceWidth: CGFloat = 0
    @State var backgroundOpacity: Double = 0
    @State var openedLittleProfile = false
    
    func changeBackground(scale:CGFloat){
        if scale != 0{
            backgroundOpacity = Double(scale > 0.9 ? 0.9/2.5 : scale/2.5)
        }else{
            backgroundOpacity = 0
        }
    }
    
    var body: some View {
//        ZStack{
//            Rectangle()
//                .ignoresSafeArea()
//                .foregroundColor(.black)
//                .opacity(backgroundOpacity)
//                .animation(.linear(duration: 0.2), value: backgroundOpacity)
//
//            ScrollView{
//                VStack(spacing:0){
//                    ForEach(1..<6){ item in
//                        SharePictureModule(backgroundOpacity:backgroundOpacity
//                                           ,changeBackground:changeBackground,
//                                           openedLittleProfile: $openedLittleProfile)
//                    }
//                }
//                .padding(.top, 22)
//            }
//
//            VStack(spacing:0) {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 100)
//                        .frame(width: 100,height: 24)
//                        .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
//                        .opacity(0.9)
//                        .overlay(RoundedRectangle(cornerRadius: 100)
//                            .stroke(Color(red: 0.65, green: 0.65, blue: 0.65),lineWidth:2.5)
//                            .frame(width: 100,height: 24))
//
//                    Text("#Share")
//                        .font(.system(size:16))
//                        .bold()
//                }
//                .offset(y: backgroundOpacity == 0 ? 2 : -50)
//                .animation(.linear(duration: 0.1), value: backgroundOpacity)
//                Spacer()
//            }
//            if openedLittleProfile{
//                Rectangle()
//                    .ignoresSafeArea()
//                    .foregroundColor(.white)
//                    .opacity(0.001)
//                    .onTapGesture {
//                            openedLittleProfile = false
//                    }
//            }
//        }
        Text("Coming Soon...")
    }
}


//struct SharePictureHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SharePictureHomeView()
//            
//    }
//}
