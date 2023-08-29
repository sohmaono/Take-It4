//
//  Custom-TabView2.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/19.
//

import SwiftUI

struct CustomTabView2: View {
    
    @Binding var num: Int
    @State var num2 = 0
    @Namespace var nameSpace
    let picArray = ["photo","person.2.fill","house"]
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Capsule(style: .continuous)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .padding(.horizontal,32)
                    .padding(.vertical,20)
                    .frame(height: 78)
                HStack {
                    ForEach(0...2,id:\.self){
                        item in
                        HStack(spacing:0){
                            Spacer()
                            ZStack {
                                Circle()
                                    .trim(from: 0.5)
                                    .frame(width: 60)
                                    .offset(y:2)
                                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                    .opacity(num == item ? 1:0)
                                VStack(spacing: 6){
                                    Image(systemName: picArray[item])
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                    if num2 == item{
                                        RoundedRectangle(cornerRadius: 1)
                                            .frame(width: 26, height: 2)
                                            .foregroundColor(.white)
                                            .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                                    }
                                }
                                .offset(y: num == item ? 3:0)
                            }
                            .offset(y: num == item ? -5:0)
                            Spacer()
                        }
                        .overlay{
                            Color.white.opacity(0.001)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.2)){
                                        num2 = item
                                    }
                                    num = item
                                }
                        }
                    }
                }
                .padding(.horizontal,45)
            }
            .onAppear{
                num2 = num
            }
            .onChange(of: num){ newValue in
                withAnimation(.linear(duration: 0.2)){
                    num2 = newValue
                }
            }
        }
        .padding(.bottom,5)
        .ignoresSafeArea()
    }
}

//struct Custom_TabView2_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView2()
//    }
//}
