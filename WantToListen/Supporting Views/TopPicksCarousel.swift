//
//  TopPicksCarousel.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct TopPicksCarousel: View {
    @EnvironmentObject var userData: UserData

    var items: [Album]
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Top Picks")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 20)
                    .padding(.top, 5)
                
                Spacer()
                    .frame(height: 1)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(self.items) { album in
                            TopPicksCarouselItem(album: album)
                        }
                    }
                    .padding(.leading, 10)
                }
            }
            .listRowInsets(EdgeInsets())
            .padding(.bottom, 15)
    }
}

struct TopPicksCarousel_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksCarousel(
            items: Array(albumData)
        )
        .environmentObject(UserData())
    }
}
