//
//  AlbumCarouselItem.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/30/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct AlbumCarouselItem: View {
    @EnvironmentObject var userData: UserData
    
    var album: Album
    
    var body: some View {
        ZStack {
            NavigationLink(destination: AlbumDetail(album: album)) {
                VStack(alignment: .leading) {
                    album.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 162, height: 162)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        
                    
                    Text(album.albumName)
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .tracking(0.2)
//                        .font(.callout)
                        .foregroundColor(.primary)
                        .frame(width: 162, alignment: .leading)
                        .lineLimit(1)
                        
                    
                    Text(album.artistName)
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .tracking(0.2)
//                        .font(.callout)
                        .foregroundColor(.secondary)
                        .frame(width: 162, alignment: .leading)
                        .lineLimit(1)
                        
                }
                .frame(width: 162, alignment: .leading)
                .padding(.leading, 10)
                
                
            }
            .buttonStyle(PlainButtonStyle())
            // BONUS: context menu
//            ContextMenu()
        }
    }
}

struct AlbumCarouselItem_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCarouselItem(
            album: albumData[0]
        )
        .environmentObject(UserData())
    }
}
