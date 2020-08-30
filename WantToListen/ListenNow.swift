//
//  ListenNow.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/30/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ListenNow: View {
    @EnvironmentObject var userData: UserData
    @State var showingProfile = false
    
    var carousels: [String: [Album]] {
        Dictionary(
            grouping: albumData,
            by: { $0.carousel.rawValue }
        )
    }
    
    var wantToListenList: [Album] {
        userData.albums
            .filter { $0.wantToListen }
            .sorted(by: {
            $0.wantToListenDate!.compare($1.wantToListenDate!) == .orderedDescending
            })
    }
    
    var profileButton: some View {
        Button(action: { }) {
            Image("beep-beep")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .accessibility(label: Text("User Profile"))
                .frame(width: 40, height: 40)
                .padding()
        }
    }

    var body: some View {
        ScrollView(.vertical) {
            Divider()
                .frame(width: 335)
            
            // Top Picks
            TopPicksCarousel(items: topPicksList)
            
            // Want to Listen
            if !wantToListenList.isEmpty {
                AlbumCarousel(carouselName: "Want to Listen", items: wantToListenList, seeAll: true)
            }

            // Recently Played
            AlbumCarousel(carouselName: "Recently Played", items: self.carousels["Recently Played"]!, seeAll: true)
            
            // More like \"Is the Is Are\"
            AlbumCarousel(carouselName: "More like \"Joyland\"", items: self.carousels["More like \"Joyland\""]!, seeAll: false)
            
            // Stations For You
            AlbumCarousel(carouselName: "Stations For You", items: self.carousels["Stations For You"]!, seeAll: false)
            
            Spacer()
                .frame(height: 100)
        }
    }
}

@available(iOS 14.0, *)
struct ListenNow_Previews: PreviewProvider {
    static var previews: some View {
        ListenNow()
            .environmentObject(UserData())
    }
}
