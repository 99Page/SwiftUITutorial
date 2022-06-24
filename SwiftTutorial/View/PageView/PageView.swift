//
//  PageView.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/22.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ViewModel().features.map { FeatureCard(landmark: $0)})
            .aspectRatio(3 / 2,contentMode: .fit)
    }
}
