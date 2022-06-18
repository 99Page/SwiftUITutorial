//
//  FavoriteButton.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

struct FavoriteButton: View {
    
    @EnvironmentObject var landmarkViewModel: LandmarkViewModel
    var index: Int
    
    var body: some View {
        Button {
            landmarkViewModel.landmarks[index].isFavorite.toggle()
        } label: {
            Image(systemName: landmarkViewModel.landmarks[index].isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(landmarkViewModel.landmarks[index].isFavorite ? .yellow : .black)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(index: 1)
    }
}
