//
//  Track.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct Track: Hashable, Codable, Identifiable {
    var id: Int
    var number: Int
    var name: String
    var starred: Bool
}
