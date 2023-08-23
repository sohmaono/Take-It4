//
//  Litle-Profile-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/02.
//

import SwiftUI

struct LittleProfileView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
            VStack(alignment: .leading,spacing: 0){
                Text("@shotaro14722")
                    .bold()
                    .font(.system(size: 14.5))
                    .padding(.vertical,5)
                Text("instagram: shotaro14722")
                    .font(.system(size: 11))
                    .bold()
                Text("twitter: shotaro14722")
                    .font(.system(size: 11))
                    .bold()
                Text("hello please go check my page")
                    .font(.system(size: 11))
                    .bold()
            }
            .padding(.horizontal,5)
        }
        .frame(width: 190,height: 100)
        .fixedSize(horizontal: true, vertical: true)
    }
}

struct Litle_Profile_View_Previews: PreviewProvider {
    static var previews: some View {
        LittleProfileView()
    }
}
