//
//  Comment-Module.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/02.
//

import SwiftUI

struct CommentModule: View {
    
    var commentInf: CommentStruct = CommentStruct(comment: "this is the best", userName: "shotaro14722", userImage: "porche1")
    
    var body: some View {
        VStack(spacing:10){
            HStack(spacing:10){
                Image(commentInf.userImage)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 38.0)
                Text(commentInf.userName)
                    .font(.system(size: 14))
                Text(ShowDate(Date()))
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.leading,50)
                Spacer()
            }
            .padding(.horizontal,15)
            HStack {
                Text(commentInf.comment)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Arial Hebrew", size: 15))
                Spacer()
                HStack(alignment:.bottom) {
                    Button(action:{}){
                        Image(systemName: "heart")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15.0)
                            .foregroundColor(.black)
                    }
                    Button(action:{}){
                        Text(String(commentInf.liked))
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                    }
                }
            }
            .padding(.horizontal,30)
            RoundedRectangle(cornerRadius: 1)
                .frame(width:UIScreen.main.bounds.width*0.8,height: 1)
                .foregroundColor(.gray)
                .opacity(0.7)
                .padding(.top,7)
                .padding(.bottom,13)
        }
    }
}

struct Comment_Module_Previews: PreviewProvider {
    static var previews: some View {
        CommentModule()
    }
}
