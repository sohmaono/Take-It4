//
//  Delete-Edit-Save.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/18.
//

import SwiftUI

struct DeleteEditSave: View{
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData2
    
    var body: some View{
        VStack {
            HStack {
                Spacer()
                VStack(spacing:8){
                    Button(action:{
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        contInfo.deleteSelected()
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 63,height: 22)
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text("Delete")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    if contInfo.selectedPicInfo != nil{
                        Button(action:{
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            withAnimation(.easeOut(duration: 0.1)){
                                editPicData.startEdit = true
                            }
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 60, height: 20)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text("Edit")
                                    .font(.system(size: 13.5))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                    }
                    Button(action:{
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        contInfo.saveSelected()
                    }){
                        ZStack{
                            Circle()
                                .frame(width: 34.5, height: 34.5)
                                .foregroundColor(.blue)
                                .opacity(0.7)
                            Image(systemName: "arrow.down.to.line.compact")
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.top,28)
                .padding(.horizontal,18)
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
