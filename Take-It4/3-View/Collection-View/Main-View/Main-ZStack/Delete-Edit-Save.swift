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
    @ObservedObject var dragData: DragData
    
    @State var showing = false
    @State var dragging = false
    
    var body: some View{
        if contInfo.selectedBool{
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing:10){
                        Button(action:{
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            contInfo.deleteSelected()
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 60,height: 24)
                                    .foregroundColor(.black)
                                    .opacity(dragging ? 0.45:0.6)
                                Text("Delete")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        if contInfo.selectedPicInfo != nil{
                            Button(action:{
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                if let data = contInfo.selectedPicInfo {
                                    EditStartingFunc(data, editPicData)
                                }
                            }){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 60, height: 22)
                                        .foregroundColor(.black)
                                        .opacity(dragging ? 0.45:0.6)
                                    Text("Edit")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                        }
                        Button(action:{
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            withAnimation(.linear(duration: 0.1)){
                                contInfo.saveSelected()
                            }
                        }){
                            ZStack{
                                Circle()
                                    .frame(width: 36)
                                    .foregroundColor(.blue)
                                    .opacity(dragging ? 0.5:0.7)
                                Image(systemName: "arrow.down.to.line.compact")
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.black)
                                    .opacity(dragging ? 0.6:0.8)
                            }
                        }
                    }
                    .padding(.top,35)
                    .padding(.horizontal,18)
                    .offset(x:showing ? 0:100)
                    .opacity(showing ? 1:0.5)
                }
                Spacer()
            }
            .allowsHitTesting(!dragging)
            .onAppear{
                withAnimation(.easeOut(duration: 0.3)){
                    showing = true
                }
            }
            .onDisappear{
                withAnimation(.easeOut(duration: 0.3)){
                    showing = false
                }
            }
            .onChange(of: dragData.drag1Started || dragData.drag2Started) { newValue in
                var sec: Double
                var delay: Double
                if newValue {
                    sec = 0.1
                    delay = 0
                } else {
                    sec = 0.2
                    delay = 0.2
                }
                withAnimation(.easeOut(duration: sec).delay(delay)){
                    dragging = newValue
                }
            }
        }
    }
}
//struct Delete_Edit_Save_Previews: PreviewProvider {
//    static var previews: some View {
//        DeleteEditSave()
//    }
//}
