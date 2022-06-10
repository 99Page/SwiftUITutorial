//
//  LandMarkDetailView.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

struct LandMarkDetailView: View {
    
    @EnvironmentObject var landmarkViewModel: LandmarkViewModel
    var landmark: LandMarkModel
    
    var landmarkIndex: Int {
        landmarkViewModel.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinates)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $landmarkViewModel.landmarks[landmarkIndex].isFavorite)
                    }

                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()

                    Text("About \(landmark.name)")
                        .font(.title2)
                    
                    Text(landmark.description)
                }
                .padding()

                Spacer()

            }
            .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandMarkDetailView_Previews: PreviewProvider {
    
    static let landmarkViewModel = LandmarkViewModel()
    static var previews: some View {
        LandMarkDetailView(landmark: LandmarkViewModel().landmarks[0])
            .environmentObject(landmarkViewModel)
    }
}
