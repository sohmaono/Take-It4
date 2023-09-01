//
//  反省作成class.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/12.
//

import Foundation
import SwiftUI

class ContentInformation: ObservableObject {
    
    @Published var selectedPicInfo: PictureInformationStruct?
    @Published var selectedTextInfo: TextInformationStruct?
    
    @Published var picInfoArray: [PictureInformationStruct] = []
    @Published var textInfoArray: [TextInformationStruct] = []
    
    var picCount: Int{
        if let selectedPicInfo {
            return picInfoArray.count + 1
        } else {
            return picInfoArray.count
        }
    }
    
    var selectedBool: Bool{
        selectedPicInfo != nil || selectedTextInfo != nil
    }
    
    func putPicInfo1(
        pic: UIImage,
        position: Position,
        imageRatio: Double){
            selectedPicInfo = PictureInformationStruct(
                image: pic,
                position: position,
                imageWidth: 130,
                num1: 0,
                num2: 0,
                num3: 0,
                num4: 0,
                colorArray: [1,1,1],
                comment: "",
                time: Date(),
                id: UUID(),
                likedNum: 0,
                imageRatio: imageRatio)
        }
    func putPicInfo2(
        item: PictureInformationStruct){
            selectedPicInfo = item
            picInfoArray = picInfoArray.filter({$0.id != item.id})
        }
    
    func putTextInfo1(
        position: Position){
            selectedTextInfo = TextInformationStruct(
                text: "",
                position: position,
                fontScale: 0.4,
                italic: false,
                fontWeight: 2,
                lineSpacing: 0,
                fontType: "",
                id: UUID())
        }
    func putTextInfo2(
        item: TextInformationStruct){
            selectedTextInfo = item
            textInfoArray = textInfoArray.filter({$0.id != item.id})
        }
    
    func saveSelected(){
        if let info = selectedPicInfo {
            picInfoArray.append(info)
        }
        if let info = selectedTextInfo {
            if info.text != "" {
                textInfoArray.append(info)
            }
        }
        deleteSelected()
    }
    
    func deleteSelected(){
        selectedPicInfo = nil
        selectedTextInfo = nil
    }
    
    
    @Published var frameHeight: CGFloat = 550
    
    func addFrameHeight(){
        if frameHeight <= 12000 {
            frameHeight += 160
        }
    }
    func subtractFrameHeight(){
        if frameHeight >= 480 {
            frameHeight -= 160
        }
    }
    
    func getTextData() {
        guard let url = URL(string: "http://127.0.0.1:5000/ctext") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedTextArray = try JSONDecoder().decode([TextInformationStruct].self, from: data)
                        self.textInfoArray = decodedTextArray
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func postTextData(){
        guard let url = URL(string: "http://127.0.0.1:5000/ctext") else { fatalError("Missing URL") }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(textInfoArray)
            request.httpBody = jsonData
        } catch {
            print("エラー:\(error)")
            return
        }
        let task = URLSession.shared.dataTask(with: request){(data,response,error) in
            guard error == nil else {
                print("送信エラー: \(error!)")
                return
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("レスポンス: \(responseString)")
            }
        }
        task.resume()
    }
}
