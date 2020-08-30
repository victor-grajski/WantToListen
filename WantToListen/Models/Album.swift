//
//  Album.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/30/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct Album: Hashable, Codable, Identifiable {
    var id: Int
    var albumName: String
    var artistName: String
    fileprivate var imageName: String
    var date: String
    var genre: String
    var wantToListen: Bool
    var wantToListenDate: Date?
    var carousel: Category
    var topPick: String
    var tracks: [Track]
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case wantToListen = "Want To Listen"
        case recentlyPlayed = "Recently Played"
        case stationsForYou = "Stations For You"
        case joyland = "More like \"Joyland\""
        case isTheIsAre = "More like \"Is the Is Are\""
        case topPicks = "Top Picks"
    }
}

extension Album {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
