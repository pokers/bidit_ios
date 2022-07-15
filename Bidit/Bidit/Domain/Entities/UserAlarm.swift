//
//  UserAlarm.swift
//  Bidit
//
//  Created by JeongMin Ko on 2022/07/13.
//

import Foundation

struct UserAlarm : Codable{
    let id: Int
    let status: Int //# 0=enable, 1=disable
    let userId: Int
    let alarmId: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String
}
