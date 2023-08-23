//
//  Delete-Edit-Save.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/18.
//

import SwiftUI

struct DeleteEditSave: View{
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData
    
    var body: some View{
        VStack {
            HStack {
                Spacer()
                VStack(spacing:14){
                    Button(action:{
                        contInfo.deleteSelected()
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 66,height: 24)
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text("Delete")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    if contInfo.selectedPicInfo != nil{
                        Button(action:{
                            withAnimation(.easeOut(duration: 0.1)){
                                editPicData.startEditPicture = true
                            }
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 63, height: 21.5)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text("Edit")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                    }
                    Button(action:{
                        contInfo.saveSelected()
                    }){
                        ZStack{
                            Circle()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.blue)
                                .opacity(0.7)
                            Image(systemName: "arrow.down.to.line.compact")
                                .frame(width: 37, height: 37)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(10)
            }
            Spacer()
        }
    }
}
//struct Delete_Edit_Save_Previews: PreviewProvider {
//    static var previews: some View {
//        DeleteEditSave()
//    }
//}
