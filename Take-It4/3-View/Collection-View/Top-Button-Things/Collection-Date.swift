//
//  CollectionDate.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/22.
//

import SwiftUI

struct CollectionDate: View {
    var body: some View {
        HStack{
            Spacer()
            Text("Since ")
                .font(.system(size:13))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35)) +
            Text(" \(ShowDate(Date()))")
                .font(.system(size:11))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
        }
        .padding(10)
    }
}

struct CollectionDate_Previews: PreviewProvider {
    static var previews: some View {
        CollectionDate()
    }
}
