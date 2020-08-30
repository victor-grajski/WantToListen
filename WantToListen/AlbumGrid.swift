//
//  AlbumGrid.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/31/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct AlbumGrid: View {
    @EnvironmentObject var userData: UserData
    
    var items: [Album]
    var title: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.init(UIColor.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(self.items) { album in
                        AlbumCarouselItem(album: album)
                    }
                }
                .padding(.trailing, 20)
                .padding(.top, 10)
                .padding(.leading, 10)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(title)
        }
    }
}

@available(iOS 14.0, *)
struct AlbumGrid_Previews: PreviewProvider {
    static var previews: some View {
        AlbumGrid(
            items: Array(albumData),
            title: "Recently Played"
        )
        .environmentObject(UserData())
    }
}
