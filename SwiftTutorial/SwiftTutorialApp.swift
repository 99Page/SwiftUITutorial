//
//  SwiftTutorialApp.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

@main
struct SwiftTutorialApp: App {
    
    @StateObject private var landmarkViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(landmarkViewModel)
        }
    }
}
