//
//  FeatureCard.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/22.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: LandMarkModel
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: LandMarkModel
    
    var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(0.6)],
                        startPoint: .bottom,
                        endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
            }
            
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ViewModel().features[0])
    }
}
