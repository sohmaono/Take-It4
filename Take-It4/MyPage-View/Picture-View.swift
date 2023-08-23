//
//  MyPage-Picture-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/29.
//

import SwiftUI

struct MyPagePictureView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action:{}){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        HStack {
                            Spacer()
                            Text("#porsche911")
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                .bold()
                                .italic()
                            .font(.system(size: 15))
                            Spacer()
                            Image(systemName: "chevron.down")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 13,height: 13)
                            Spacer()
                        }
                    }
                    
                    .frame(width: 150,height: 40)
                }
            }
            
            Spacer()
        }
    }
}

struct MyPage_Picture_View_Previews: PreviewProvider {
    static var previews: some View {
        MyPagePictureView()
    }
}
