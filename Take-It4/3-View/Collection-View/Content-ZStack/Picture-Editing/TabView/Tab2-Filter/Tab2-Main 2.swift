//
//  Tab2- Main.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

import SwiftUI

struct CEditTab2: View {
    
    @ObservedObject var editPicData: EditPicData2
    
    @State var toggleMode = true
    
    var body: some View {
        HStack(spacing:20){
            if toggleMode {
                VStack(spacing:28){
                    HStack(spacing:25){
                        Image("color-circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18.0)
                            .saturation(1.5)
                            .opacity(0.7)
                        CFilterBar(rate: $editPicData.num1)
                    }
                    HStack(spacing:25){
                        Image("color-circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18.0)
                            .brightness(-0.2)
                            .opacity(0.7)
                        CFilterBar(rate: $editPicData.num2)
                    }
                    HStack(spacing:25){
                        Image("color-circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18.0)
                            .contrast(2)
                            .opacity(0.7)
                        CFilterBar(rate: $editPicData.num3)
                    }
                    HStack(spacing:25){
                        Image("color-circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18.0)
                            .grayscale(0.9)
                            .opacity(0.7)
                        CFilterBar(rate: $editPicData.num4)
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
                        .frame(width: 25.0)
                }
        }
    }
}

struct Tab2__Main_Previews: PreviewProvider {
    static var previews: some View {
        CEditTab2(editPicData: EditPicData2())
    }
}
