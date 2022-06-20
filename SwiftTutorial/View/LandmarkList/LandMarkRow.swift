//
//  LandMarkRow.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

struct LandMarkRow: View {
    
    var landmark: LandMarkModel
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
            }
            
        }
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    
    static var landmarks = ViewModel().landmarks
    
    static var previews: some View {
        LandMarkRow(landmark: landmarks[1])
    }
}
