//
//  UserData.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/1/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showWantToListen = false
    @Published var albums = albumData
}
