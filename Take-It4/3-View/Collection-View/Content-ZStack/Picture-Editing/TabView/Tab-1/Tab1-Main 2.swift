//
//  Tab1-Main.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

import SwiftUI

struct CEditTab1: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    var body: some View {
        VStack{
            CCaptionTextField(editPicData: editPicData)
            Button(action:{}){
                Text("Post")
            }
        }
    }
}

//struct Tab1_Main_Previews: PreviewProvider {
//    static var previews: some View {
//        CEditTab1()
//    }
//}
