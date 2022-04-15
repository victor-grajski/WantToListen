# How To Run
##### Requires XCode
* Clone repo
* Open in XCode
* Run in XCode. Works best on iPhone 11 Pro, iPhone 12 mini, and iPhone 13 mini (as of 3/19/22)

# Test User Flow
1. Scroll to `More Like "Joyland"` carousel
2. Tap on `Modern Mirror by Drab Majesty` (excellent album btw)
3. Tap on the `+ Add` button in the top right corner
4. Tap `Add to Want to Listen`
5. Navigate back to `Listen Now` and you should see a `Want to Listen` carousel below `Top Picks`
6. Tap `See All` in the `Want to Listen` carousel for a list view
7. Tap `Modern Mirror by Drab Majesty` in the list view 
8. Tap the Checkmark button in the top right corner
9. Tap `Remove from Want to Listen`
10. You should be navigated to `Listen Now`, and the `Want to Listen` carousel should be missing
11. You can add/remove any album in the app to `Want to Listen`, and since this is a prototype, `Modern Mirror` is the only one with track data so the other album detail pages aren't fully building

# Key Code Samples
## [`WantToListen/AlbumDetail.swift`](https://github.com/victor-grajski/WantToListen/blob/main/WantToListen/AlbumDetail.swift)
```
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
```

## [`WantToListen/Supporting Views/TopPicksCarouselItem.swift`](https://github.com/victor-grajski/WantToListen/blob/main/WantToListen/Supporting%20Views/TopPicksCarouselItem.swift)
```
struct TopPicksCarouselItem: View {
    @EnvironmentObject var userData: UserData
    
    var album: Album
    
    var body: some View {
        NavigationLink(destination: AlbumDetail(album: album)) {
            VStack(alignment: .leading) {
                Text(album.topPick)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 0) {
                    album.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 249, height: 249)
                    
                    album.image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .blur(radius: 50)
                        .background(Color.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.9))
                        .offset(y: 81)
                        .frame(width: 249, height: 86)
                        .overlay(
                            VStack {
                                Text(album.albumName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.init(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
                                
                                Text(album.artistName)
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .foregroundColor(.init(red: 208 / 255, green: 211 / 255, blue: 211 / 255))
                                
                                Text(album.date)
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .foregroundColor(.init(red: 208 / 255, green: 211 / 255, blue: 211 / 255))
                            }
                        )
                }
                .cornerRadius(10)
            }
            .padding(.leading, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TopPicksCarouselItem_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksCarouselItem(
            album: albumData[2]
        )
        .environmentObject(UserData())
    }
}
```

## [`WantToListen/Models/Data.swift`](https://github.com/victor-grajski/WantToListen/blob/main/WantToListen/Models/Data.swift)
```
let albumData: [Album] = load("albumData.json")
let wantToListenList = albumData.filter { $0.wantToListen }
let topPicksList = albumData.filter { $0.topPick != "" }

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
```
