//
//  VideoPlayerView.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        
        //video url
        let bundle_url = Bundle.main.path(forResource: "video", ofType: "mp4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        
        //player
        let player = AVPlayer(url: video_url)
        controller.player = player
        
        //hiding controls
        controller.showsPlaybackControls = false
        controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

