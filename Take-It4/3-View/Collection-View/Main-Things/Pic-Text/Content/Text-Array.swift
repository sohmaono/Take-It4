//
//  TextArrayView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/24.
//

import SwiftUI

struct CollectionTextArray: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    var body: some View {
        ZStack{
            ForEach(contInfo.textInfoArray) { item in
                Text(item.text)
                    .fixedSize(horizontal: true, vertical: false)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .italic(item.italic)
                    .fontWeight(fontWeightArray[item.fontWeight])
                    .kerning(item.lineSpacing)
                    .font(item.fontType != "" ? .custom(item.fontType, size: 50) : .system(size: 50))
                    .scaleEffect(item.fontScale)
                    .padding(25)
                    .position(x: item.position.x, y:item.position.y)
                    .onTapGesture {
                        contInfo.saveSelected()
                        DispatchQueue.main.async{
                            contInfo.putTextInfo2(item: item)
                        }
                    }
                    .overlay{
                        CollectionDragHandler(contInfo: contInfo, dragData: dragData)
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded({
                                        if !(dragData.drag1Started || dragData.drag2Started){
                                            contInfo.saveSelected()
                                            DispatchQueue.main.async{
                                                contInfo.putTextInfo2(item: item)
                                            }
                                        }
                                    }))
                    }
            }
        }
    }
}
//
//struct TextArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextArrayView()
//    }
//}
