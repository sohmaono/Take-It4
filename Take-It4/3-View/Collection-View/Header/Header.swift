//
//  Header.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/24.
//

import SwiftUI

struct CollectionHeader: View {
    @EnvironmentObject var pmp: PracticeForMP
    
    @ObservedObject var folderHandler: FolderHandler
    @ObservedObject var contInfo: ContentInformation
    
    @Binding var openPageMenu: Bool
    @State var rotate = false
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.linear(duration:0.2)){
                    self.rotate.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
                    withAnimation(.linear(duration:0.2)){
                        self.openPageMenu.toggle()
                    }
                }
            }) {
                HStack(spacing:12){
                    HStack(spacing:6){
                        Image(systemName: "number")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .frame(width: 16)
                        Text(folderHandler.selectedFolder?.title ?? "")
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .font(.system(size: 23))
                            .italic()
                            .fontWeight(.semibold)
                    }
                    Image(systemName: "chevron.down")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 11)
                        .fontWeight(.semibold)
                        .rotationEffect(.degrees(rotate ? 180:0))
                }
            }
            .onChange(of: openPageMenu) { newValue in
                withAnimation(.linear(duration:0.2)){
                    rotate = newValue
                }
            }
            
            HStack{
                Spacer()
                Button(action:{
                    pmp.info = contInfo
//                    withAnimation(.linear(duration: 0.15)){
//                        folderHandler.openNewFolderPage = true
//                    }
                }){
                    Image(systemName: "folder.badge.plus")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 25)
                        .padding(.horizontal,15)
                        .padding(.vertical,8)
                }
            }
        }
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionHeader()
//    }
//}
