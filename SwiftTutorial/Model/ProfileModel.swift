//
//  ProfileModel.swift
//  SwiftTutorial
//
//  Created by λΈμ°μ on 2022/06/18.
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
        case spring = "πΉ"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"
        
        var id: String { rawValue }
    }
}


