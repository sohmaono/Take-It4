//
//  New-Page-View.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/09/01.
//
//
import SwiftUI

struct CNewPageView: View {
    
    @ObservedObject var folderHandler: FolderHandler
    
    @State var text = "MyLife"
    @State var tappedHashTag = false
    @State var linkVersion = false
    @State var tappedFolder = false
    
    var tappedFirstTrue: some Gesture {
        LongPressGesture(minimumDuration: 0)
            .onEnded({ _ in
                withAnimation(.easeOut(duration: 0.1)){
                    tappedHashTag = true
                }
            })
    }
    
    var tappedSecondToggle: some Gesture{
        TapGesture()
            .onEnded {
                linkVersion.toggle()
                withAnimation(.easeOut(duration: 0.1)){
                    tappedHashTag = false
                }
            }
    }
    
    var tappedThirdToggle: some Gesture {
        LongPressGesture(minimumDuration: 0)
            .onEnded({ _ in
                withAnimation(.easeOut(duration: 0.1)){
                    tappedFolder = true
                }
            })
    }
    
    var tappedFourthToggle: some Gesture{
        TapGesture()
            .onEnded {
                withAnimation(.easeOut(duration: 0.1)){
                    tappedFolder = false
                }
                let value = FolderInformationStruct(title: text)
                withAnimation(.linear(duration: 0.2).delay(0.2)){
                    folderHandler.addFolder(value)
                }
            }
    }
    
    var body: some View {
        ZStack{
            VStack(spacing: 12){
                Text("add folder here.")
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                HStack(spacing:10){
                    Image(systemName: linkVersion ? "link" : "number")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .fontWeight(.bold)
                        .frame(width: tappedHashTag ? 16:20)
                        .gesture(tappedFirstTrue)
                        .simultaneousGesture(tappedSecondToggle)
                    
                    TextField("add", text: $text)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            
            VStack{
                Spacer()
                Spacer()
                Spacer()
                HStack(spacing:4){
                    Image(systemName: "folder.badge.plus")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: tappedFolder ? 25:30)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
                .gesture(tappedThirdToggle)
                .simultaneousGesture(tappedFourthToggle)
                Spacer()
            }
            if folderHandler.selectedFolder != nil {
                VStack{
                    HStack{
                        Button(action:{
                            withAnimation(.easeOut(duration: 0.15)){
                                folderHandler.openNewFolderPage = false
                            }
                        }){
                            HStack{
                                Image(systemName: "arrow.left")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.black)
                                    .frame(width: 18.0)
                                    
                                Text("Back")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                    .padding(20)
                    Spacer()
                }
            }
        }
    }
}

struct NewPageViewPreviews: PreviewProvider {
    static var previews: some View {
        CNewPageView(folderHandler: FolderHandler())
    }
}
