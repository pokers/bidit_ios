//
//  DateUtil.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/04.
//

import Foundation

// 지금시간으로부터 마감까지 남은 날짜 계산(**일 후 마감)
func calcRestDay(end : String) -> String{
    
    let now = Date()
    let endTime = stringConvertToDateTime(time: end)
    
    //출력 포맷 설정
    let format = DateFormatter()
//    format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard let convertedEndTime = format.date(from: end) else { return "" }
    
    //let nowDay = Calendar.current.dateComponents([.day], from: now)
    //let endDay = Calendar.current.dateComponents([.day], from: convertedEndTime)
    
//    guard let startTime = format.date(from: now) else {return "?"}
//    guard let endTime =  format.date(from: self.end) else {return "?"}
    let interval = "\(Int(convertedEndTime.timeIntervalSince(now)/(60*60*24)))일 후 마감"
    print("interval is  : \(interval)")
    return interval.description
    
}


// 지금시간으로부터 마감까지 남은 날짜 계산(**일 **:**:**)
func calcRestDayAndTime(end : String) -> String{
    
    let now = Date()
    let endTime = stringConvertToDateTime(time: end)
    
    //출력 포맷 설정
    let format = DateFormatter()
//    format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard let convertedEndTime = format.date(from: end) else { return "" }
    
    //let endDay = Calendar.current.dateComponents([.day], from: convertedEndTime)
    
    let interval = convertedEndTime.timeIntervalSince(now)
    
//    guard let startTime = format.date(from: now) else {return "?"}
//    guard let endTime =  format.date(from: self.end) else {return "?"}
    let restDay = Int(convertedEndTime.timeIntervalSince(now)/(60*60*24))
    let hour = Int(Int(convertedEndTime.timeIntervalSince(now)) - restDay*60*60*24) / (60*60)
    let minite = Int(Int(convertedEndTime.timeIntervalSince(now)) - restDay*60*60*24 - hour * 60 * 60) / 60
    let second = Int(Int(convertedEndTime.timeIntervalSince(now)) - restDay*60*60*24 - hour * 60 * 60 - minite * 60) % 60
    //시간
    print("restDay is  : \(restDay)일 \(hour):\(minite):\(second)")
    let result = "\(restDay)일 \(hour):\(minite):\(second)"
    return result.description
    
}


//변환
func stringConvertToDateTime(time : String) -> String {
    let date = Date()
    
       let stringFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
       let formatter = DateFormatter()
       formatter.dateFormat = stringFormat
       formatter.locale = Locale(identifier: "ko")
       guard let tempDate = formatter.date(from: time) else {
           return ""
       }
    print("not yet transform time is \(tempDate)")
       formatter.dateFormat = "yyyy-MM-dd"
    
    //print("not yet transform time is \(tempDate)")
     
    
       return formatter.string(from: tempDate)
   }

/*
 *월*일 **:**
 */
func stringConvertDueDate(time : String) -> String {
    let date = Date()
    
       let stringFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
       let formatter = DateFormatter()
       formatter.dateFormat = stringFormat
       formatter.locale = Locale(identifier: "ko")
       guard let tempDate = formatter.date(from: time) else {
           return ""
       }
    print("not yet transform time is \(tempDate)")
       formatter.dateFormat = "yyyy-MM-dd"
    
    //print("not yet transform time is \(tempDate)")
    let endDay = Calendar.current.dateComponents([.day], from: tempDate).day
    let endMonth = Calendar.current.dateComponents([.month], from: tempDate).month
    let endhour = Calendar.current.dateComponents([.hour], from: tempDate).hour
    let endminute = Calendar.current.dateComponents([.minute], from: tempDate).minute
       return "\(endMonth!)월 \(endDay!)일 \(endhour!):\(endminute!)"
   }

