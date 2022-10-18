//
//  AVVideoPlayerController.swift
//  SplitViewTesting
//
//  Created by Agus Hery on 18/10/22.
//

import AVKit
import SwiftUI

struct AVVideoPlayerController: UIViewControllerRepresentable {
    var videoURL: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.showsPlaybackControls = true
        controller.player = player
        controller.player?.play()
        return controller
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        return
    }
}
