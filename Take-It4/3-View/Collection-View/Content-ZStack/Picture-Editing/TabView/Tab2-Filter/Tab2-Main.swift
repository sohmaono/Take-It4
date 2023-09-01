//
//  Tab2- Main.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

import SwiftUI

struct CEditTab2: View {
    
    @ObservedObject var editPicData: EditPicData
    
    @State var toggleMode = true
    
    var body: some View {
        HStack(spacing:18){
            if toggleMode {
//                VStack(spacing:18){
//                    HStack(spacing:28){
//                        Image("color-circle")
//                            .resizable(resizingMode: .stretch)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 18.0)
//                            .saturation(2)
//                            .opacity(0.7)
//                        CEditFilterBar(rate: $editPicData.num1)
//                    }
//                    HStack(spacing:28){
//                        Image("color-circle")
//                            .resizable(resizingMode: .stretch)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 18.0)
//                            .brightness(-0.4)
//                            .opacity(0.7)
//                        CEditFilterBar(rate: $editPicData.num2)
//                    }
//                    HStack(spacing:28){
//                        Image("color-circle")
//                            .resizable(resizingMode: .stretch)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 18.0)
//                            .contrast(3)
//                            .opacity(0.7)
//                        CEditFilterBar(rate: $editPicData.num3)
//                    }
//                    HStack(spacing:28){
//                        Image("color-circle")
//                            .resizable(resizingMode: .stretch)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 18.0)
//                            .grayscale(1)
//                            .opacity(0.7)
//                        CEditFilterBar(rate: $editPicData.num4)
//                    }
//                }
                HStack{
                    VStack(spacing:20){
                        Text("saturation")
                            .foregroundColor(Color(
                            red: 0.05+0.1*editPicData.num1,
                            green: 0.2+0.27*editPicData.num1,
                            blue: 0.4+0.27*editPicData.num1))
                        Text("brightness")
                            .foregroundColor(Color(
                            red: 0.05+0.1*editPicData.num2,
                            green: 0.2+0.27*editPicData.num2,
                            blue: 0.4+0.27*editPicData.num2))
                        Text("contrast")
                            .foregroundColor(Color(
                            red: 0.05+0.1*editPicData.num3,
                            green: 0.2+0.27*editPicData.num3,
                            blue: 0.4+0.27*editPicData.num3))
                        Text("grayscale")
                            .foregroundColor(Color(
                            red: 0.05+0.1*editPicData.num4,
                            green: 0.2+0.27*editPicData.num4,
                            blue: 0.4+0.27*editPicData.num4))
                    }
                    .bold()
                    .font(.system(size: 12))
                    VStack(spacing: 0){
                        CEditFilterBar(rate: $editPicData.num1)
                        CEditFilterBar(rate: $editPicData.num2)
                        CEditFilterBar(rate: $editPicData.num3)
                        CEditFilterBar(rate: $editPicData.num4)
                    }
                }
            } else {
                CFilterCircle(editPicData: editPicData)
            }
            Button(action: {
                withAnimation(.easeOut(duration:0.2)){
                    toggleMode.toggle()
                }}) {
                    Image(systemName: "plus.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .frame(width: 22.0)
                }
        }
    }
}

struct Tab2__Main_Previews: PreviewProvider {
    static var previews: some View {
        CEditTab2(editPicData: EditPicData())
    }
}
