//
//  MyPage-Profile-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/29.
//

import SwiftUI

struct MyPageProfileView: View {
    var body: some View {
        VStack {
            HStack(spacing:0){
                VStack(spacing: 15){
                    Text("Take It.")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    Text("shotaro14722")
                        .font(.system(size: 20))
                        .offset(x:20)
                }
                Spacer()
                
                HStack(spacing:0) {
                    Image("porche1")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 130.0, height: 130.0)
                    
                    ZStack{
                        Image(systemName: "bell")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20,height:20)
                        Circle()
                            .position(x:13)
                            .frame(width:12,height:12)
                            .foregroundColor(.red)
                    }
                }
            }
            .padding(15)
            HStack{
                HStack {
                    Image(systemName: "person")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        .frame(width: 20.0, height: 20.0)
                    Text("15")
                }
                HStack{
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22.0, height: 22.0)
                    Text("21")
                }
                HStack{
                    Image(systemName: "heart.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        .frame(width: 20.0, height: 20.0)
                    Text("35")
                }
            }
            Spacer()
        }
        
    }
}

struct MyPage_Profile_View_Previews: PreviewProvider {
    static var previews: some View {
        MyPageProfileView()
    }
}
