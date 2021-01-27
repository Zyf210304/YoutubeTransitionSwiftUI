//
//  Home.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI

struct Home: View {
    
    @StateObject var player = VideoPlayerViewModel()
    
    @GestureState var gestureOffset : CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            ScrollView {
                
                VStack(spacing: 15) {
                    
                    ForEach(videos) { video in
                        
                        VideoCardView(video: video)
                            .onTapGesture {
                                player.showPlayer.toggle()
                            }
                    }
                }
            }
            
            if player.showPlayer {
                
                MiniPlayerView()
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .gesture(
                        DragGesture()
                            .updating($gestureOffset, body: { (value, state, _) in
                                
                                state = value.translation.height
                            })
//                            .onChanged(onChanged(value:))
                            .onEnded(onEnd(value:))
                    )
            }
        })
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        .environmentObject(player)
    }
    
    func onChanged() {
        
        if  player.offset >= 0 && !player.isMiniPlayer && player.offset + 70 <= player.height{
            
            player.offset = gestureOffset
        }
    }
    
    func onEnd(value : DragGesture.Value) {
        
        withAnimation(.default) {
            
            if !player.isMiniPlayer {
                
                player.offset = 0
                
                if  value.translation.height > UIScreen.main.bounds.height / 3 {
                    
                    player.isMiniPlayer = true
                } else {
                    
                    player.isMiniPlayer = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
