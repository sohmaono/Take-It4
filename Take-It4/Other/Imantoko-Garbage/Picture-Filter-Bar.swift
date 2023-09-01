////
////   Picture-Filter-Bar.swift
////  Take-It3
////
////  Created by 小野聡真 on 2023/08/07.
////
//import SwiftUI
//
//struct PictureFilterBar: View {
//    @State var geometryWidth: CGFloat = 0
//    @Binding var selectedNum: Double
//    
//    let screenWidth = UIScreen.main.bounds.width
//    
//    var dragGesture: some Gesture{
//        DragGesture()
//            .onChanged{ change in
//                if change.location.x < geometryWidth/8{
//                    withAnimation(.linear(duration:0.1)){
//                        selectedNum = 0
//                    }
//                } else if change.location.x > geometryWidth/8*7{
//                    withAnimation(.linear(duration:0.1)){
//                        selectedNum = 4
//                    }
//                } else {
//                    switch change.location.x{
//                    case geometryWidth/8...geometryWidth/8*3:
//                        withAnimation(.linear(duration:0.1)){
//                            selectedNum = 1
//                        }
//                    case geometryWidth/8*3...geometryWidth/8*5:
//                        withAnimation(.linear(duration:0.1)){
//                            selectedNum = 2
//                        }
//                    case geometryWidth/8*5...geometryWidth/8*7:
//                        withAnimation(.linear(duration:0.1)){
//                            selectedNum = 3
//                        }
//                    default:
//                        selectedNum = 0
//                    }
//                }
//            }
//    }
//    
//    var body: some View {
//        Capsule()
//            .frame(width: screenWidth*0.45,height: 3)
//            .foregroundStyle(Color(red: 0.6, green: 0.6, blue: 0.6))
//            .overlay{
//                GeometryReader{ geometry in
//                    
//                    let height = geometry.size.height
//                    let width = geometry.size.width
//                    
//                    ZStack {
//                        ForEach(1..<4){
//                            num in
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 3,height:8.5)
//                                .position(x:width/4*CGFloat(num),y:height/2)
//                                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
//                        }
//                        
//                        ZStack {
//                            Circle()
//                                .foregroundStyle(.white.shadow(.drop(radius: 10)))
//                            Circle()
//                                .stroke(lineWidth: 3)
//                                .foregroundColor(Color.blue)
//                        }
//                        .padding(5)
//                        .frame(width: 20,height: 20)
//                        .position(x: geometryWidth/4*selectedNum, y: height/2)
//                        .gesture(dragGesture)
//                    }
//                    .onChange(of: selectedNum, perform: { newValue in
//                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
//                    })
//                    .onAppear{
//                        geometryWidth = geometry.size.width
//                    }
//                }
//            }
//    }
//}
