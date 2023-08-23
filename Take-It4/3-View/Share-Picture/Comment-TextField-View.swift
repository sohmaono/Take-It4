//
//  Comment-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/02.
//

import SwiftUI

struct CommentTextFieldView: View {
    
    @State var commentText = ""
    
    var body: some View {
        HStack {
            TextField(" comment...", text: $commentText)
                .padding(.horizontal,14)
                .padding(.vertical,5.8)
                .overlay {
                    RoundedRectangle(cornerRadius: 17)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                }
            Button(action:{}){
                Image(systemName: "paperplane.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(5)
            }
        }
        .padding(15)
    }
}

struct Comment_View_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextFieldView()
    }
}
