//
//  ContentView.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = Tab.list
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            
            CategoryHome()
                .tag(Tab.featured)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
            LandMarkListView()
                .tag(Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
