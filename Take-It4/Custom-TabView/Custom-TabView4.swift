////
////  Custom-TabView4.swift
////  Take-It3
////
////  Created by 小野聡真 on 2023/08/20.
////
//
//import SwiftUI
//
//struct CustomTabView4: View {
//    
//    @State var num2 = 0
//    @Binding var num: Int
//    let size = UIScreen.main.bounds.width
//    @Namespace var nameSpace
//    
//    var body: some View {
//        VStack{
//            Spacer()
//            VStack(spacing:5){
//                Rectangle()
//                    .frame(height: 2)
//                ZStack{
//                    Capsule(style: .continuous)
//                        .foregroundColor(strokeColor)
//                        .frame(height: 25)
//                        .padding(.horizontal,30)
//                        .offset(y:14)
//                    HStack{
//                        Spacer()
//                        
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 6)
//                                .foregroundColor(backColor)
//                                .frame(width: 53, height: 43)
//                            Image(systemName: "photo.fill")
//                                .resizable(resizingMode: .stretch)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 38.0, height: 38.0)
//                                .foregroundColor(strokeColor)
//                        }
//                        .onTapGesture {
//                            num = 0
//                        }
//                        .scaleEffect(0.65)
//                        .offset(y: num2 == 0 ? -5:2)
//                        Spacer()
//                        VStack{
//                            ZStack{
//                                Image(systemName: "person.2.fill")
//                                    .resizable(resizingMode: .stretch)
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 65.0, height: 65.0)
//                                    .foregroundColor(backColor)
//                                
//                                Circle()
//                                    .trim(from: 0.5, to: 1)
//                                    .foregroundColor(backColor)
//                                    .frame(width:63.5)
//                                    .offset(y:22)
//                                
//                                Image(systemName: "person.2.fill")
//                                    .resizable(resizingMode: .stretch)
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 48.0, height: 48.0)
//                                    .foregroundColor(strokeColor)
//                            }
//                            .scaleEffect(0.65)
//                            .onTapGesture {
//                                num = 1
//                            }
//                            .offset(y:num2 == 1 ? -5:3)
//                        }
//                        Spacer()
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 7)
//                                .foregroundColor(backColor)
//                                .frame(width: 46, height: 26)
//                                .offset(y:12)
//                            Image(systemName: "house.fill")
//                                .resizable(resizingMode: .stretch)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 42.0, height: 42.0)
//                                .foregroundColor(strokeColor)
//                        }
//                        .onTapGesture {
//                            num = 2
//                        }
//                        .scaleEffect(0.65)
//                        .offset(y:num2 == 2 ? -7:0)
//                        Spacer()
//                    }
//                }
//                .onChange(of: num) { newValue in
//                    withAnimation(.linear(duration: 0.15)){
//                        num2 = newValue
//                    }
//                }
//                .offset(y: -10)
//            }
//            .background(backColor)
//        }
//        .ignoresSafeArea()
//    }
//}

//struct Custom_TabView4_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView4()
//    }
//}
