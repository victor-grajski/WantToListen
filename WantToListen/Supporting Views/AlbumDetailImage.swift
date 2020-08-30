//
//  AlbumDetailImage.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct AlbumDetailImage: View {
    var image: Image
    
    // BONUS: drop shadow
    var body: some View {
        image
            .resizable()
            .frame(width: 231, height: 231)
            .cornerRadius(8)
//            .shadow(radius: 10, y: 5)
            .padding(.bottom, 10)
    }
}

struct AlbumDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailImage(image: Image("modern-mirror"))
    }
}
