//
//  CommentArrayView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/02.
//

import SwiftUI


struct CommentArrayView: View {
    
    @State var array = [CommentStruct(comment: "this is the best", userName: "shotaro14722", userImage: "porche1"),CommentStruct(comment: "the night", userName: "shotaro14722", userImage: "porche1"),CommentStruct(comment: "the best thing we", userName: "shotaro14722", userImage: "porche1"),CommentStruct(comment: "red porsche makes me feel the best is bestbesut elfofvnenweri", userName: "shotaro14722", userImage: "porche1")]

    var body: some View {
        ScrollView{
            VStack(spacing:0){
                ForEach(array){ item in
                    CommentModule(commentInf: item)
                }
            }
        }
    }
}

struct CommentArrayView_Previews: PreviewProvider {
    static var previews: some View {
        CommentArrayView()
    }
}
