//
//  Blur.swift
//  WantToListen
//
//  Created by Victor Grajski on 8/8/20.
//  Copyright © 2020 Victor Grajski. All rights reserved.
//
// @source: https://medium.com/@edwurtle/blur-effect-inside-swiftui-a2e12e61e750

import SwiftUI

import SwiftUI
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemChromeMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
