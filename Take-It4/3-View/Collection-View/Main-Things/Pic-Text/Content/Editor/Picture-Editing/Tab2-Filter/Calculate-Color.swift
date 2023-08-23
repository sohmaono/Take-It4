//
//  Calculate-Color-Multiply.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/08/07.
//
import Foundation

func CalculateColorMultiply(start:Int,end:Int,colorTotal:Double,longWay:Bool)->[Double]{
    
    let middle = (start + end)/2
    
    var bluePoints = 0
    var redPoints = 0
    var greenPoints = 0
    
    if start < end {
        
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
    } else if start > end{
        
        //blue
        if start >= 240 {
            bluePoints += 14400 - (start-240)*(start-240)
        } else if start <= 120 {
            bluePoints += 14400 + (120-start)*(120-start)
        }
        if end <= 120 {
            bluePoints += 14400 - (120-end)*(120-end)
        } else if end >= 240 {
            bluePoints += 14400 + (end-240)*(end-240)
        }
        
        //red
        if end <= 120 {
            redPoints += end*end
        } else if end <= 240 {
            redPoints += 14400 + (240-end)*(240-end)
        }
        if start <= 120 {
            redPoints += 14400 - start*start + 14400
        } else if start <= 240 {
            redPoints += (240-start)*(240-start)
        }
        
        //green
        if start >= 240 {
            greenPoints += (360-start)*(360-start)
        } else if start >= 120 {
            greenPoints += 14400 + 14400 - (120-start)*(120-start)
        }
        if end >= 240 {
            greenPoints += 14400 - (360-end)*(360-end) + 14400
        } else if end >= 120{
            greenPoints += (end-120)*(end-120)
        }
    } else if start == end && !longWay{
        if start <= 120 {
            redPoints = start
            bluePoints = 120 - start
        } else if start <= 240 {
            greenPoints = start - 120
            redPoints = 240 - start
        } else if start <= 360 {
            bluePoints = start - 240
            greenPoints = 360 - start
        }
    } else if start == end && longWay {
        redPoints = 1
        greenPoints = 1
        bluePoints = 1
    }
    
    let total = greenPoints + redPoints + bluePoints
    let redDouble = Double(redPoints) / Double(total) * colorTotal
    let blueDouble = Double(bluePoints) / Double(total) * colorTotal
    let greenDouble = Double(greenPoints) / Double(total) * colorTotal
    
    let basicColor = 1 - colorTotal / 3
    
    return [redDouble+basicColor,blueDouble+basicColor,greenDouble+basicColor]
}
