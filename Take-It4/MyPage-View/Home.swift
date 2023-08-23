//
//  MyPage-Home-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/27.
//

import SwiftUI

struct MyPageHomeView: View {
    var body: some View {
        ScrollView{
            VStack{
                MyPageProfileView()
                MyPagePictureView()
            }
        }
    }
}

struct MyPage_Home_View_Previews: PreviewProvider {
    static var previews: some View {
        MyPageHomeView()
    }
}
