//
//  Home.swift
//  WantToListen
//
//  Created by Victor Grajski on 7/31/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct Home: View {
    @EnvironmentObject var userData: UserData
    @State private var selection = 0
    
    init() {
        let standardAppearance = UINavigationBarAppearance()
        let scrollEdgeAppearance = UINavigationBarAppearance()
        
        standardAppearance.shadowColor = .clear
        standardAppearance.backgroundColor = UIColor.systemBackground
        
        scrollEdgeAppearance.backgroundColor = UIColor.systemBackground
        scrollEdgeAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = standardAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
    
    var profileButton: some View {
        Button(action: { }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
        
//        Button(action: { }) {
//            Image("beep-beep")
//                .resizable()
//                .scaledToFill()
//                .clipShape(Circle())
//                .accessibility(label: Text("User Profile"))
//                .frame(width: 40, height: 40)
//                .padding()
//                .offset(y: 50)
//        }
//        .buttonStyle(PlainButtonStyle())
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                ZStack {
                                
                    Color.init(UIColor.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                        
                    ListenNow()
                        .navigationBarTitle("Listen Now", displayMode: .automatic)
                        .navigationBarItems(trailing: profileButton)
                }
            }
            .tabItem {
                VStack {
                     Image(systemName: "play.circle.fill")
                     Text("Listen Now")
                }
            }
            .tag(0)
           
            
           Text("Browse")
               .font(.title)
               .tabItem {
                   VStack {
                    Image(systemName: "square.grid.2x2.fill")
                       Text("Browse")
                   }
               }
               .tag(1)
            
            Text("Radio")
                .font(.title)
                .tabItem {
                    VStack {
                     Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }
                }
                .tag(2)
            
            Text("Library")
                .font(.title)
                .tabItem {
                    VStack {
                     Image(systemName: "square.stack.fill")
                        Text("Library")
                    }
                }
                .tag(3)
            
            Text("Search")
                .font(.title)
                .tabItem {
                    VStack {
                     Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(4)
        }
        .accentColor(.init(red: 241 / 255, green: 33 / 255, blue: 57 / 255))
        .overlay(
            NowPlayingBar()
                .offset(x: 0, y: 287)
                .padding(.bottom, 0)
        )
    }
}

// BONUS/FEATURE REQUEST: hide image in compact navigation bar
// create state variable with height of navbar
// if height > 44, hide image else show image
//extension UINavigationController {
////    open override func viewWillLayoutSubviews() {
////          let width = self.view.frame.width
////          let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
////          self.view.addSubview(navigationBar);
////          let navigationItem = UINavigationItem(title: "Navigation bar")
////          let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
////          navigationItem.rightBarButtonItem = doneBtn
////          navigationBar.setItems([navigationItem], animated: false)
////       }
//
//    open override func viewDidLoad() {
//        super.viewDidLoad()
//        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 44))
//        view.addSubview(navigationBar)
//
//        let navigationItem = UINavigationItem(title: "SomeTitle")
//
//        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
//        btn.setBackgroundImage(UIImage(named: "beep-beep"), for: .normal, barMetrics: .default)
//
//        navigationItem.rightBarButtonItem = btn
//        navigationBar.setItems([navigationItem], animated: false)
//       }
//
//    @objc func selectorX() { }
//}

@available(iOS 14.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())
    }
}
