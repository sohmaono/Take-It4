//
//  Text-Add-Button.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/24.
//

import SwiftUI

struct TextAddButton: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var otherData: COtherData
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            otherData.show1toggle(0.2)
            otherData.toggleAndGetGeometry.toggle()
            DispatchQueue.main.async{
                contInfo.putTextInfo1(position: Position(
                    x: UIScreen.main.bounds.width/2,
                    y: otherData.scrolledLength+300))
            }
        }){
            HStack(spacing:20){
                Image(systemName: "character.bubble")
                    .font(.system(size: 23))
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                Text("Add Text")
                    .font(.system(size: 14.9))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
        }
        .offset(x:-6)
    }
}

struct Text_Add_Button_Previews: PreviewProvider {
    static var previews: some View {
        TextAddButton(contInfo: ContentInformation(),otherData: COtherData())
    }
}
