//
//  NowPlayingBar.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct NowPlayingBar: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("discos-of-imhotep")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .cornerRadius(3)
                
                Text("The Way of the Tree...")
                
                Image(systemName: "play.fill")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
                    .padding()
                
                Image(systemName: "forward.fill")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
                    .padding()
            }
            .frame(height: 63)
            .frame(maxWidth: .infinity)
            .background(Blur())
            
            Divider()
        }
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar()
    }
}
