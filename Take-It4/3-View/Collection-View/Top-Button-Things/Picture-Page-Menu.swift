//
//  MyPage-Menu-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/26.
//

//import SwiftUI
//
//struct PicturePageMenu: View {
//
//    @Binding var openPageMenu: Bool
//
//    var body: some View {
//        ZStack {
//            ScrollView(showsIndicators: false){
//                VStack(alignment: .leading){
//                    if picturePageViewInf.pictureViewTitleArray.count != 0{
//                        ForEach((0..<picturePageViewInf.pictureViewTitleArray.count
//                                )){
//                            num in
//                            Button(action: {
//                                picturePageViewInf.selectedPage = num
//                                withAnimation(.linear(duration: 0.1)){
//                                    openPageMenu = false
//                                }
//                            }){
//                                HStack {
//                                    Text("#\(picturePageViewInf.pictureViewTitleArray[num].title)"
//                                    )
//                                    .foregroundColor(.black)
//                                    .font(.system(size: 20))
//                                    .fontWeight(.heavy)
//                                    .padding(.horizontal, 7)
//                                    .padding(.bottom,1)
//                                    .foregroundColor(.black)
//                                    .lineLimit(1)
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                }
//                .padding(.all, 10)
//            }
//            .frame(maxHeight: 200)
//            .frame(width: 160)
//            .scrollDisabled(picturePageViewInf.pictureViewTitleArray.count < 5)
//
//            HStack{
//                Spacer()
//                VStack{
//                    Button(action: {
//                        openPageMenu = false
//                    }){
//                        Image(systemName: "xmark.circle.fill")
//                            .resizable(resizingMode: .stretch)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 15.0)
//                            .padding(.all, 10)
//                            .foregroundColor(.gray)
//                            .opacity(0.5)
//                    }
//                    Spacer()
//                }
//            }
//            .clipped()
//        }
//        .frame(width:160)
//        .fixedSize(horizontal: false, vertical: true)
//        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: 15))
//    }
//}
//
//struct MyPageMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        MyPageMenu()
//            .environmentObject(PictureViewPageInf())
//    }
//}
