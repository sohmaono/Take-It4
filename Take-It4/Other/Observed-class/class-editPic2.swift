//
//  class-editPic2.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/28.
//

import SwiftUI

class EditPicData2: ObservableObject {
    @Published var startEdit = false
    
    @Published var num1: Double = 0
    @Published var num2: Double = 0
    @Published var num3: Double = 0
    @Published var num4: Double = 0
    
    @Published var red: Double = 1
    @Published var green: Double = 1
    @Published var blue: Double = 1
    
    @Published var filterCircleData = CFilterCircleData()
    
    func resetFilterCircleData(){
        filterCircleData = CFilterCircleData()
        DispatchQueue.main.async{
            self.red = 1
            self.green = 1
            self.blue = 1
            print("set1")
        }
    }
    
    @Published var clipPicData = ClippingPictureData()
    
    @Published var caption = ""
}

