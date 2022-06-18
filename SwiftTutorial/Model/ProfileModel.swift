//
//  ProfileModel.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/18.
//

import Foundation

struct Profile: Identifiable {
    var id = UUID()
    var username: String
    var prefersNotifications = false
    var seasonalPhoto = Season.spring
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌹"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "❄️"
        
        var id: String { rawValue }
    }
}


