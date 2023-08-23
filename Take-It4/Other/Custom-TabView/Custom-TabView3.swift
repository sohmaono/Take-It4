////
////  Custom-TabView3.swift
////  Take-It3
////
////  Created by 小野聡真 on 2023/08/20.
////
//
//import SwiftUI
//
//let backColor: Color = Color(red: 0.92, green: 0.92, blue: 0.92)
//let strokeColor: Color = Color(red: 0.2, green: 0.2, blue: 0.2)
//
//struct CustomTabView3: View {
//    
//    let picArray = ["photo","person.2.fill","house"]
//    
//    @State var positionArray: [CGFloat] = [0,0,0]
//    @Binding var num: Int
//    @State var num2 = 0
//    @Namespace var nameSpace
//    
//    var body: some View {
//        ZStack{
//            Capsule(style: .continuous)
//                .frame(height: 48)
//                .foregroundColor(strokeColor)
//                .padding(.horizontal,30)
//            
//            CircleForTabView()
//                .offset(x: positionArray[num]-positionArray[1], y: -10)
//            
//            Capsule(style: .continuous)
//                .frame(height: 42)
//                .foregroundColor(backColor)
//                .padding(.horizontal,33)
//            
//            HStack{
//                ForEach(0...2,id:\.self){
//                    item in
//                    HStack{
//                        Spacer()
//                        
//                        ZStack {
//                            VStack(spacing: 6){
//                                Image(systemName: picArray[item])
//                                    .font(.system(size: 20))
//                                    .foregroundColor(strokeColor)
//                                    .overlay{
//                                        GeometryReader{
//                                            geometry in
//                                            Text("")
//                                                .onAppear{
//                                                    positionArray[item] =
//                                                    geometry.frame(in: .global).midX
//                                                }
//                                        }
//                                    }
//                                if num2 == item{
//                                    RoundedRectangle(cornerRadius: 1)
//                                        .frame(width: 26, height: 2)
//                                        .foregroundColor(strokeColor)
//                                        .matchedGeometryEffect(id: "rectangle", in: nameSpace)
//                                }
//                            }
//                        }
//                        
//                        Spacer()
//                    }
//                    .onTapGesture {
//                        num = item
//                    }
//                }
//            }
//            .padding(.horizontal,40)
//            .onChange(of: num) { newValue in
//                withAnimation(.linear(duration: 0.2)){
//                        num2 = newValue
//                    }
//            }
//        }
//    }
//}
//
//struct CircleForTabView:View{
//    var body: some View{
//        ZStack {
//            Circle()
//                .frame(width: 55)
//                .foregroundColor(strokeColor)
//            Circle()
//                .frame(width:49)
//                .foregroundColor(backColor)
//        }
//    }
//}

//struct Custom_TabView3_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView3()
//    }
//}
