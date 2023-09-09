//
//  SharedPictureView2.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/25.
//

import SwiftUI

struct SharedCollectionView: View {
    
    @EnvironmentObject var pmp: PracticeForMP
    @StateObject var cData = CollectionData()
    
    var body: some View {
        ZStack {
            SPicTextArray(cData: cData)
                .blur(radius: cData.picSelected ? 3:0)
//                .animation(.easeOut(duration: 0.2), value: cData.picSelected)
            
            Color.black
                .ignoresSafeArea()
                .opacity(cData.picSelected ? 0.15:0)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 0.2)){
                        cData.selectedPic = nil
                    }
                }
            
            SSelectedPicture(cData: cData)
        }
        .ignoresSafeArea()
        .onAppear {
            cData.getArray(pmp.info)
        }
    }
}

struct SharedPictureView_Previews: PreviewProvider {
    static var previews: some View {
        SharedCollectionView()
            .environmentObject(PracticeForMP())
    }
}
