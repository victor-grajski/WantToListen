//
//  TrackDetail.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/18/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct TrackDetail: View {
    @EnvironmentObject var userData: UserData
    
    var track: Track
    
    var body: some View {
        VStack {
            HStack() {
                if track.starred {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .accessibility(label: Text("Starred track"))
                        .foregroundColor(.secondary)
                        .frame(width: 18, alignment: .trailing)
                } else {
                    Spacer()
                        .frame(width: 26, alignment: .trailing)
                }
                
                Text(String(track.number))
                    .frame(width: 15)
                    .foregroundColor(.secondary)
                
                Text(track.name)
                    .frame(width: 250, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .accessibility(label: Text("Add track to library"))
                    .font(Font.body.weight(.bold))
                    .frame(width: 45, alignment: .leading)
                    .foregroundColor(.init(red: 241 / 255, green: 33 / 255, blue: 57 / 255))

            }
            .frame(maxWidth: .infinity)
            .padding(.top, 6)
            .padding(.bottom, 6)
            
            Divider()
                .offset(x: 50)
        }
    }
}

struct TrackDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        
        TrackDetail(
            track: userData.albums[0].tracks[2]
        )
        .environmentObject(userData)
    }
}
