//
//  FrameHeightButton.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/23.
//

import SwiftUI

struct FrameHeightButton: View {
    
    @ObservedObject var contInfo: ContentInformation
    
    var body: some View {
        VStack(spacing:10){
            Text("Take-It.")
                .font(.system(size: 13))
                .fontWeight(.heavy)
            
            HStack{
                Spacer()
                Button(action: {
                    contInfo.saveSelected()
                    withAnimation(.easeOut(duration: 0.2)){
                        contInfo.addFrameHeight()
                    }
                }){
                    Image(systemName: "chevron.down.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                        .frame(width: 35)
                        .padding(5)
                }
                
                Button(action: {
                    contInfo.saveSelected()
                    withAnimation(.easeOut(duration: 0.2)){
                        contInfo.subtractFrameHeight()
                    }
                }){
                    Image(systemName: "chevron.up.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                        .frame(width: 35)
                        .padding(5)
                }
                Spacer()
            }
            .padding(.bottom,50)
        }
    }
}

//struct FrameHeightButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameHeightButton()
//    }
//}
