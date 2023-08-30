//
//  Header.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/24.
//

import SwiftUI

struct CollectionHeader: View {
    
    @ObservedObject var contInfo: ContentInformation
    
    @Binding var openPageMenu: Bool
    @ObservedObject var e: EditPicData2
    @State var rotate = false
    
    var body: some View {
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
            HStack(spacing:8){
                Text("# porsche911")
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .font(.system(size: 17))
                    .italic()
                Image(systemName: "chevron.down")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .frame(width: 11)
                    .rotationEffect(.degrees(rotate ? 180:0))
            }
            .padding(.horizontal,11)
            .padding(.vertical,8)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
            }
        }
        .onChange(of: openPageMenu) { newValue in
            withAnimation(.linear(duration:0.2)){
                rotate = newValue
            }
        }
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionHeader()
//    }
//}
