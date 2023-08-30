//
//  Calculate-Color-Multiply.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//
import Foundation

func CalculateColorMultiply(start:Int,end:Int,colorTotal:Double)->[Double]{
    
    var colorArray = [0,0,0]
    
    if start < end {
        colorArray = CalculateWithStartEnd(start: start, end: end)
    } else if start > end{
        let colorArray2 = CalculateWithStartEnd(start: end, end: start)
        colorArray[0] = 28800 - colorArray2[0]
        colorArray[1] = 28800 - colorArray2[1]
        colorArray[2] = 28800 - colorArray2[2]
    } else if start == end{
        if start >= 0 && start <= 120{
            colorArray[0] = start
            colorArray[2] = 120 - start
        } else if start >= 120 && start <= 240 {
            colorArray[1] = 240 - start
            colorArray[2] = start - 120
        } else if start >= 240 {
            colorArray[2] = 360 - start
            colorArray[0] = start - 240
        }
    }
    
    let total = colorArray.reduce(0,{$0 + $1})
    let redDouble = Double(colorArray[0]) / Double(total) * colorTotal
    let greenDouble = Double(colorArray[1]) / Double(total) * colorTotal
    let blueDouble = Double(colorArray[2]) / Double(total) * colorTotal
    
    let basicColor = 1 - colorTotal
    
    return [redDouble+basicColor,greenDouble+basicColor,blueDouble+basicColor]
}


func CalculateWithStartEnd(start:Int,end:Int)->[Int]{
    var bluePoints = 0
    var greenPoints = 0
    var redPoints = 0
    
    let middle = (start + end)/2
    let range = start...end
    
    //calculate blue
    if range.contains(120){
        bluePoints += (start-120)*(start-120)
    }
    if range.contains(240){
        bluePoints += (end-240)*(end-240)
    }
    if bluePoints == 0 && middle <= 120{
        bluePoints += (120-start)*(120-start)-(120-end)*(120-end)
    }
    if bluePoints == 0 && middle >= 240{
        bluePoints += (end-240)*(end-240)-(start-240)*(start-240)
    }
    
    //calculate red
    if range.contains(120){
        redPoints += 14400 - start*start
        if range.contains(240){
            redPoints += 14400
        } else {
            redPoints += 14400 - (240-end)*(240-end)
        }
    } else if range.contains(240){
        redPoints += (240-start)*(240-start)
    }else if 120 >= middle{
        redPoints += end*end-start*start
    }else if 240 >= middle{
        redPoints += (240-start)*(240-start)-(240-end)*(240-end)
    }
    
    //calculate green
    if range.contains(240){
        greenPoints += 14400-(360-end)*(360-end)
        if !range.contains(120){
            greenPoints += 14400 - (start-120)*(start-120)
        } else {
            greenPoints += 14400
        }
    } else if range.contains(120){
        greenPoints += (end-120)*(end-120)
    } else if (120...240).contains(middle){
        greenPoints += (end-120)*(end-120)-(start-120)*(start-120)
    } else if (240...360).contains(middle){
        greenPoints += (360-start)*(360-start)-(360-end)*(360-end)
    }
    
    return [redPoints,greenPoints,bluePoints]
}
