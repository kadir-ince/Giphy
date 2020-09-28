//
//  GifController.swift
//  Giphy
//
//  Created by Kadir Ince on 28.09.2020.
//

import SwiftUI
import GiphyCoreSDK
import GiphyUISDK

struct GifController: UIViewControllerRepresentable {
    @Binding var url : String
    @Binding var present : Bool
    func makeCoordinator() -> Coordinator {
        return GifController.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> GiphyViewController {
        Giphy.configure(apiKey: "VQBgt4nvURJclT967IgjNvUdjKD4kQof")
        let controller = GiphyViewController()
        controller.mediaTypeConfig = [.emoji, .gifs, .stickers]
        controller.delegate = context.coordinator
        // for fullscreen giphy screen
        GiphyViewController.trayHeightMultiplier = 1.05
        // for light theme (giphy theme)
        controller.theme = GPHTheme(type: .light)
        return controller
    }

    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {}
    
    class Coordinator: NSObject, GiphyDelegate {
        func didDismiss(controller: GiphyViewController?) {
            
        }
        
        var parent: GifController
        
        init(parent: GifController) {
            self.parent = parent
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            let url = media.url(rendition: .fixedWidth, fileType: .gif)
            parent.url = url ?? ""
            parent.present.toggle()
        }
    }
}

