//
//  Caption-TextField-View.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//

import SwiftUI

struct CCaptionTextField: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    @FocusState var focusTextField: Bool
    
    var body: some View {
        TextEditor(text: $editPicData.caption)
            .font(.system(size: 15))
            .frame(height:49)
            .focused($focusTextField)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button(action: {focusTextField = false}){
                        Text("Done")
                            .fontWeight(.black)
                    }
                }
            }
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth:1)
                    .foregroundColor(.gray)
            }
//     6       .overlay{
//                GeometryReader{ geometry in
//                    ZStack{
//                        ZStack{
//                            Rectangle()
//                                .trim(from: 0.75,to:1)
//                                .stroke(lineWidth: 2.5)
//                                .foregroundColor(.gray)
//                                .frame(width: 6,height: 6)
//                            Rectangle()
//                                .trim(from: 0,to:0.25)
//                                .stroke(lineWidth: 2.5)
//                                .foregroundColor(.gray)
//                                .frame(width: 6,height: 6)
//                        }
//                        .position(x: 6, y: 6)
//
//                        Rectangle()
//                            .trim(from: 0,to:0.5)
//                            .stroke(lineWidth: 2.5)
//                            .foregroundColor(.gray)
//                            .frame(width: 6,height: 6)
//                            .position(x: geometry.size.width-6, y: 6)
//                        Rectangle()
//                            .trim(from: 0.25,to:0.75)
//                            .stroke(lineWidth: 2.5)
//                            .foregroundColor(.gray)
//                            .frame(width: 6,height: 6)
//                            .position(x: geometry.size.width-6, y: geometry.size.height-6)
//                        Rectangle()
//                            .trim(from: 0.5,to:1)
//                            .stroke(lineWidth: 2.5)
//                            .foregroundColor(.gray)
//                            .frame(width: 6,height: 6)
//                            .position(x: 6,y: geometry.size.height-6)
//                    }
//                }
//            }
    }
}
