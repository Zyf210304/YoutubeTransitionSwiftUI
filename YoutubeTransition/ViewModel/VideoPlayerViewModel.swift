//
//  VideoPlayerViewModel.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    
    @Published var showPlayer = false
    
    @Published var offset : CGFloat = 0
    @Published var width : CGFloat = UIScreen.main.bounds.width
    @Published var height : CGFloat = 0
    @Published var isMiniPlayer = false
    
    @Published var playerView = VideoPlayerView()
}

