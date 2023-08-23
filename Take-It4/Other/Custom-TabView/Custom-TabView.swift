//
//  Custom-TabView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/18.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var num = 0
    @State var num2 = 0
    @State var positionArray: [Double] = [0,0,0]
    @State var positionY: CGFloat = 0
    @Namespace var nameSpace
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Capsule()
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(width:400,height: 38.5)
                    .offset(y: 15.5)
                
//                Circle()
//                    .foregroundColor(.blue)
//                    .frame(width: 60)
//                    .position(x:200,y: positionY-15)
//                    .animation(.easeInOut(duration: 0.2), value: num)
//
                HStack(spacing:0){
                    ForEach(0...2,id:\.self){
                        item in
                        Spacer()
                        if item == num {
                            Circle()
                                .stroke(lineWidth: 4)
                                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                                .frame(width: 38
                                )
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y:-5)
                                .matchedGeometryEffect(id: "rectangle", in: nameSpace)
//                                .overlay{
//                                    GeometryReader { geometry in
//                                        ZStack{}
//                                            .onAppear{
//                                                positionArray[item] = geometry.frame(in: .global).midX
//                                                positionY = geometry.frame(in: .global).midY
//                                            }
//                                    }
//                                }
                        } else {
                            Button(action:{
                                withAnimation(.easeOut(duration:0.12)){
                                    num = item
                                }
                                num2 = item
                            }){
                                Circle()
                                    .frame(width:40)
                                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                                    .padding(7)
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
//                            .overlay{
//                                GeometryReader { geometry in
//                                    ZStack{}
//                                        .onAppear{
//                                            positionArray[item] = geometry.frame(in: .global).midX
//                                        }
//                                }
//                            }
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal,15)
            }
            .padding(.horizontal,15)
            .frame(height: 65)
            .offset(y: -22)
        }
        //        .frame(width: .infinity, height: .infinity)
        .ignoresSafeArea()
    }
}

struct Custom_TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
