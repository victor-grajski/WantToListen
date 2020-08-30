//
//  AlbumCarousel.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/30/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct AlbumCarousel: View {
    @EnvironmentObject var userData: UserData
    
    var carouselName: String
    var items: [Album]
    var seeAll: Bool
    
    @State private var isTapped: Bool = false
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(carouselName)
                        .font(.title2)
                        .bold()
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    if seeAll {
                        NavigationLink(destination: AlbumGrid(items: items, title: carouselName)) {
                            Text("See All")
                                .padding(.trailing, 20)
                                .foregroundColor(.init(red: 241 / 255, green: 33 / 255, blue: 57 / 255))
                        }
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(self.items) { album in
                            NavigationLink(destination: AlbumDetail(album: album).environmentObject(self.userData)) {
                                AlbumCarouselItem(album: album)
                            }
                        }
                    }
                    .padding(.leading, 10)
                }
                
                Spacer()
                
                Divider()
                    .frame(width: 335)
                    .offset(x: 20)
            }
            .listRowInsets(EdgeInsets())
            .frame(height: 275)
    }
}

@available(iOS 14.0, *)
struct AlbumCarousel_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCarousel(
            carouselName: "Recently Played",
            items: Array(albumData),
            seeAll: true
        )
        .environmentObject(UserData())
    }
}
