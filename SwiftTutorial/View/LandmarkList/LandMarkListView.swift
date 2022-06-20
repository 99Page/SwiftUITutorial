//
//  LandMarkListView.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

struct LandMarkListView: View {
    
    @State private var lastShowFavoritesOnly = true
    @State private var showFavoritesOnly = true
    @EnvironmentObject var landmarkViewModel: ViewModel
    
    var fillteredLanMarks: [LandMarkModel] {
        landmarkViewModel.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites")
                }
                
                ForEach (fillteredLanMarks) { landmark in
                    NavigationLink {
                        LandMarkDetailView(landmark: landmark)
                    } label: {
                        LandMarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .onDisappear {
                lastShowFavoritesOnly = showFavoritesOnly
                showFavoritesOnly = false
            }
            .onAppear {
                showFavoritesOnly = lastShowFavoritesOnly
            }
        }
    }
}

struct LandMarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkListView()
    }
}
