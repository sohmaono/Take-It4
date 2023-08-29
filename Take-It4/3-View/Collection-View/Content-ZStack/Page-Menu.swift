//
//  MyPage-Menu-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/26.
//

import SwiftUI

struct CPageMenu: View {
    
    @Binding var openPageMenu: Bool
    
    var body: some View {
        if openPageMenu{
            VStack{
                ZStack{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing:9){
                            VStack(spacing:0){
                                ForEach(0..<5){
                                    num in
                                    Button(action:{}){
                                        Text("# porsche\(num)")
                                            .font(.system(size:17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                            .padding(.vertical,6)
                                    }
                                }
                            }
                            VStack(spacing:10){
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: 130, height: 1)
                                Button(action:{}){
                                    HStack{
                                        Image(systemName: "plus")
                                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                        Text("Add Folder")
                                            .font(.system(size:16))
                                            .fontWeight(.heavy)
                                            .italic()
                                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                    }
                                }
                            }
                        }
                        .padding(.bottom,15)
                        .padding(.top,16)
                    }
                    VStack {
                        HStack {
                            Spacer()
                            Button(action:{
                                openPageMenu = false
                            }){
                                Image(systemName: "plus")
                                    .font(.system(size: 19))
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .rotationEffect(.degrees(-45))
                            }
                            .padding(.horizontal,5)
                            .padding(.vertical,12)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .frame(width: 170)
                .frame(maxHeight: 180)
                .fixedSize(horizontal: false, vertical: true)
                .background{
                    ZStack{
                        Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .shadow(radius: 10)
                .offset(y:200)
                Spacer()
            }
        }
    }
}

//struct MyPageMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        CPageMenu()
//    }
//}
