//
//  PictureEdit-TabView.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct CPictureEditTabView: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var editPicData: EditPicData2
    
    @Binding var tabSelection: Int
    @State var tabSelection2 = 1
    @Namespace var nameSpace
    
    var body: some View {
        ZStack(alignment:.top){
            TabView(selection: $tabSelection) {
                CEditTab1(editPicData: editPicData).tag(0)
                CEditTab2(editPicData: editPicData).tag(1)
            }
            .frame(height: 160)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top,25)
            
            HStack(spacing: 0){
                Button(action:{
                    tabSelection = 0
                    print("tab should change to 0")
                }){
                    VStack(spacing:5){
                        Image(systemName: "signpost.left.fill")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(tabSelection2 == 0 ? .blue:.gray)
                            .frame(width: 15.0)
                            .bold(tabSelection2 == 0)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 2)
                            .foregroundColor(.white)
                            .overlay{
                                if tabSelection2 == 0{
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(height: 2)
                                        .foregroundColor(.blue)
                                        .matchedGeometryEffect(id: "CEditTab", in: nameSpace)
                                }
                            }
                    }
                }
                Button(action:{tabSelection = 1}){
                    VStack(spacing:5){
                        Image(systemName: tabSelection2 == 1 ? "drop.fill":"drop")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(tabSelection2 == 1 ? .blue:.gray)
                            .frame(width: 11)
                            .bold()
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 2)
                            .foregroundColor(.white)
                            .overlay{
                                if tabSelection2 == 1{
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(height: 2)
                                        .foregroundColor(.blue)
                                        .matchedGeometryEffect(id: "CEditTab", in: nameSpace)
                                }
                            }
                    }
                }
            }
            .onChange(of: tabSelection, perform: { newValue in
                withAnimation(.easeOut(duration: 0.1)){
                    tabSelection2 = newValue
                }
            })
            .onAppear{
                tabSelection = 1
            }
        }
        .padding(.horizontal,20)
        .padding(.top,15)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15,style: .continuous))
    }
}
//
//struct PictureEdit_TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CPictureEditTabView()
//    }
//}
