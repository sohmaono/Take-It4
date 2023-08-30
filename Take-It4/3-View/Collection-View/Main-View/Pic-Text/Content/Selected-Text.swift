//
//  Selected-Text.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/15.
//

import SwiftUI

struct CSelectedText: View {
    
    @ObservedObject var contInfo: ContentInformation
    @ObservedObject var dragData: DragData
    
    @State var text = ""
    
    @FocusState var focused: Bool
    @State var focused2 = false
    
    @State var openSelectingFont = false
    
    var body: some View {
        ZStack{
            if contInfo.selectedTextInfo != nil {
                if !focused2{
                    Text(contInfo.selectedTextInfo!.text)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .lineLimit(1)
                        .italic(contInfo.selectedTextInfo!.italic)
                        .fontWeight(fontWeightArray[contInfo.selectedTextInfo!.fontWeight])
                        .kerning(contInfo.selectedTextInfo!.lineSpacing)
                        .background{
                            GeometryReader { geometry in
                                Button {
                                    focused = true
                                    focused2 = true
                                } label: {
                                    ZStack{
                                        Circle()
                                            .frame(width: 85)
                                            .foregroundColor(.gray)
                                            .opacity(0.5)
                                            .padding(10)
                                        Image(systemName: "pencil.line")
                                            .font(.system(size: 27))
                                            .foregroundColor(.white)
                                    }
                                }
                                .position(x: geometry.size.width+50, y: 0)
                            }
                        }
                        .scaleEffect(contInfo.selectedTextInfo!.fontScale)
                        .fixedSize(horizontal: true, vertical: false)
                        .multilineTextAlignment(.center)
                        .font(contInfo.selectedTextInfo!.fontType != "" ? .custom(contInfo.selectedTextInfo!.fontType, size: 50) : .system(size: 50))
                        .position(
                            x: contInfo.selectedTextInfo!.position.x,
                            y:contInfo.selectedTextInfo!.position.y)
                        .animation(
                            .linear(duration: 0.1), value: contInfo.selectedTextInfo!.fontScale)
                    
                } else {
                    TextField("...",text:$text)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: true, vertical: false)
                        .focused($focused)
                        .italic(contInfo.selectedTextInfo!.italic)
                        .fontWeight(fontWeightArray[contInfo.selectedTextInfo!.fontWeight])
                        .kerning(contInfo.selectedTextInfo!.lineSpacing)
                        .font(contInfo.selectedTextInfo!.fontType != "" ? .custom(contInfo.selectedTextInfo!.fontType, size: 50) : .system(size: 50))
                        .scaleEffect(contInfo.selectedTextInfo!.fontScale)
                        .position(
                            x: contInfo.selectedTextInfo!.position.x,
                            y:contInfo.selectedTextInfo!.position.y)
                        .onChange(of: text, perform: { newValue in
                            contInfo.selectedTextInfo!.text = newValue
                        })
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard){
                                HStack(spacing:2){
                                    BoldItalicButton(
                                        contInfo: contInfo,
                                        openSelectingFont: $openSelectingFont)
                                    Spacer()
                                    Button(action: {
                                        if text == "" {
                                            contInfo.deleteSelected()
                                        }
                                        focused = false
                                        focused2 = false
                                        openSelectingFont = false
                                    }){
                                        Text("Done")
                                            .fontWeight(.black)
                                    }
                                }
                            }
                        }
                        .onAppear{
                            text = contInfo.selectedTextInfo!.text
                        }
                }
                if openSelectingFont{
                    SelectingFont(
                        contInfo: contInfo,
                        openSelectingFont:$openSelectingFont)
                        .position(
                            x: UIScreen.main.bounds.width/2,
                            y: contInfo.selectedTextInfo!.position.y)
                        .offset(y:-((50*contInfo.selectedTextInfo!.fontScale+25)/2)-50)
                }
            }
        }
        .onAppear(perform: {
            if contInfo.selectedTextInfo!.text.isEmpty {
                focused = true
                focused2 = true
            }
        })
    }
}

//struct Selected_Text_Previews: PreviewProvider {
//    static var previews: some View {
//        Selected_Text()
//    }
//}
