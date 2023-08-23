//
//  MyPage-Picture-Menu.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/29.
//

import SwiftUI

struct MyPagePictureMenu: View {
    
    var array = ["a","b","c","d"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                .opacity(0.4)
            ScrollView{
                VStack(spacing:0){
                    ForEach(array,id:\.self){
                        item in
                        VStack(spacing:0) {
                            Button(action:{}){
                                HStack {
                                    Text(item)
                                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                        .font(.system(size: 19))
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                .padding(.horizontal,25)
                                .padding(.vertical,5)
                            }
                            RoundedRectangle(cornerRadius: 1)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                                .frame(width: 100,height: 1)
                        }
                    }
                }
            }
        }
        .frame(width: 150,height: 150)
    }
}
struct MyPage_Picture_Menu_Previews: PreviewProvider {
    static var previews: some View {
        MyPagePictureMenu()
    }
}
