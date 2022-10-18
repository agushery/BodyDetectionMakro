//
//  VideoPlayerController.swift
//  MakroTestingCamera
//
//  Created by Agus Hery on 17/10/22.
//

import Foundation
import SwiftUI
import YouTubePlayerKit
import AVFoundation

struct YoutubeVideoPlayerController: UIViewControllerRepresentable {
    var videoURL: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }

    func makeUIViewController(context: Context) -> YouTubePlayerViewController {
        let youTubePlayerViewController = YouTubePlayerViewController(
            player: "https://youtube.com/shorts/fzu-DBhRUUg"
        )
        youTubePlayerViewController.player.configuration.autoPlay = true
        youTubePlayerViewController.player.configuration.showRelatedVideos = false
        return youTubePlayerViewController
    }

    func updateUIViewController(_ playerController: YouTubePlayerViewController, context: Context) {
        return
    }
}

