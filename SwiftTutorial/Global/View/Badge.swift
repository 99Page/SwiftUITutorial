//
//  Badge.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/12.
//

import SwiftUI

struct Badge: View {
    
    var badgeSymbols: some View {
        
        ForEach (0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(8)) * 360)
                .opacity(0.5)
            
        }
    }
    
    var body: some View {
        ZStack{
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1 / 4, anchor: .top)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 3 / 4)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
