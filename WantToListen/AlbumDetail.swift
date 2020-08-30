//
//  AlbumDetail.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/31/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

struct AlbumDetail: View {
    @EnvironmentObject var userData: UserData
    @State var showActionSheet: Bool = false
    
    var album: Album

    var albumIndex: Int {
        userData.albums.firstIndex(where: { $0.id == album.id })!
    }
    
    // FEATURE REQUEST: accent color
    var actionSheet: ActionSheet {
        var wantToListenAction : Text

        if !userData.albums[self.albumIndex].wantToListen {
            wantToListenAction = Text("Add to Want to Listen")
        } else {
            wantToListenAction = Text("Remove from Want to Listen")
        }
            
        return ActionSheet(title: Text("If you want to listen to this album later, you can add it to your Want to Listen list."), buttons: [
                .default(wantToListenAction) {
                    
                    if !userData.albums[self.albumIndex].wantToListen {
                        userData.albums[self.albumIndex].wantToListenDate = Date()
                    } else {
                        userData.albums[self.albumIndex].wantToListenDate = nil
                    }
                    
                    userData.albums[self.albumIndex].wantToListen.toggle()
                },
                .default(Text("Add to Library")),
                .cancel(Text("Cancel"))
            ])
        }
    
    // BONUS: animation
    var addButton: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }) {
            if !userData.albums[self.albumIndex].wantToListen {
                ZStack {
                    Capsule()
                        .fill(Color.init(UIColor.systemGray6))
                        .frame(width: 63, height: 28)
                    
                    HStack {
                        Image(systemName: "plus")
                            .imageScale(.small)
                            .accessibility(label: Text("Add to Want to Listen"))
                            .offset(x: 2)
                        
                        Text("Add")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .offset(x: -3)
                    }
                }
            } else {
                ZStack {
                    Circle()
                        .fill(Color.init(UIColor.systemGray6))
                        
                    
                    Image(systemName: "checkmark")
                        .imageScale(.medium)
                        .accessibility(label: Text("Remove from Want to Listen"))
                }
                .frame(width: 28, height: 28)
            }
        }
        .actionSheet(isPresented: $showActionSheet, content: { self.actionSheet })
    }
    
    var moreButton: some View {
        Button(action: {}) {
            ZStack {
                Circle()
                    .fill(Color.init(UIColor.systemGray6))
                    
                    
                
                Image(systemName: "ellipsis")
                    .imageScale(.medium)
                    .accessibility(label: Text("More"))
            }
            .frame(width: 28, height: 28)
            .padding(.leading, 15)
        }
    }
    
    var body: some View {
        ZStack {
            Color.init(UIColor.systemBackground)
                .edgesIgnoringSafeArea(.all)
        
            ScrollView(.vertical) {
                AlbumDetailImage(image: album.image)
                
                Text(album.albumName)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 2)
                
                Button(action: {}){
                    Text(album.artistName)
                        .font(.title3)
                        .foregroundColor(.init(red: 241 / 255, green: 33 / 255, blue: 57 / 255))
                }
                
                Spacer()
                    .frame(height: 5)
                
                Text("\(album.genre.uppercased()) ⋅ \(album.date)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                
                HStack(spacing: 20) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "play.fill")
                                .imageScale(.small)
                                .accessibility(label: Text("Play"))
                            
                            Text("Play")
                                .font(.headline)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 158, height: 48)
                                .foregroundColor(Color.init(UIColor.systemGray6))
                        )
                        .frame(width: 158, height: 48)
                    }
                    

                    Button(action: {}) {
                        HStack {
                            Image(systemName: "shuffle")
                                .imageScale(.small)
                                .accessibility(label: Text("Shuffle"))
                            
                            Text("Shuffle")
                                .font(.headline)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 158, height: 48)
                                .foregroundColor(Color.init(UIColor.systemGray6))
                        )
                        .frame(width: 158, height: 48)
                    }
                }
                
                Spacer()
                    .frame(height: 25)
                
                Divider()
                    .offset(x: 20)
                
                ForEach(album.tracks) { track in
                    TrackDetail(track: track)
                }
            }
            .padding(.top, 6)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                HStack(spacing: 10) {
                    addButton
                    
                    moreButton
                }
                .frame(width: 150, alignment: .trailing)
            )
        }
    }
}

struct AlbumDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        AlbumDetail(
            album: userData.albums[0]
        )
            .environmentObject(userData)
    }
}
