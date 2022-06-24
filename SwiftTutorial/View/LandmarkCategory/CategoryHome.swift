//
//  CategoryHome.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/18.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var showingProfile: Bool = false

    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: viewModel.features.map { FeatureCard(landmark: $0)})
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

                ForEach(viewModel.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: viewModel.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ViewModel())
    }
}
