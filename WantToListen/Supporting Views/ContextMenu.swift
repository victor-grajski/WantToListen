//
//  ContextMenu.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/7/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//
// @source: https://github.com/kylebshr/context-menus

import SwiftUI

// BONUS/FEATURE REQUEST: preview

struct ContextMenu: UIViewRepresentable {
    typealias UIViewType = UIView
    
    private let menuView = UIView()
    
    class Coordinator: NSObject, UIContextMenuInteractionDelegate {
        
        var parent: ContextMenu

        init(_ parent: ContextMenu) {
            self.parent = parent
        }
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in
                    return self.makeContextMenu()
            })
        }
        
        func makeContextMenu() -> UIMenu {
            // Create a UIAction for sharing
            let share = UIAction(title: "Share Pupper", image: UIImage(systemName: "square.and.arrow.up")) { action in
                // Show system share sheet
            }

            // Create and return a UIMenu with the share action
            return UIMenu(title: "Main Menu", children: [share])
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIView {
        
        menuView.addInteraction(
            UIContextMenuInteraction(
                delegate: context.coordinator
            )
        )
        
        return menuView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
