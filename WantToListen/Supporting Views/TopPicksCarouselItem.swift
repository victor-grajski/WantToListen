//
//  TopPicksCarouselItem.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct TopPicksCarouselItem: View {
    @EnvironmentObject var userData: UserData
    
    var album: Album
    
    var body: some View {
        NavigationLink(destination: AlbumDetail(album: album)) {
            VStack(alignment: .leading) {
                Text(album.topPick)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 0) {
                    album.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 249, height: 249)
                    
                    album.image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .blur(radius: 50)
                        .background(Color.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.9))
                        .offset(y: 81)
                        .frame(width: 249, height: 86)
                        .overlay(
                            VStack {
                                Text(album.albumName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.init(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
                                
                                Text(album.artistName)
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .foregroundColor(.init(red: 208 / 255, green: 211 / 255, blue: 211 / 255))
                                
                                Text(album.date)
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .foregroundColor(.init(red: 208 / 255, green: 211 / 255, blue: 211 / 255))
                            }
                        )
                }
                .cornerRadius(10)
            }
            .padding(.leading, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TopPicksCarouselItem_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksCarouselItem(
            album: albumData[2]
        )
        .environmentObject(UserData())
    }
}
