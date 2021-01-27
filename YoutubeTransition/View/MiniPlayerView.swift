//
//  MiniPlayerView.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI

struct MiniPlayerView: View {
    
    
    @EnvironmentObject var player : VideoPlayerViewModel
    
    var body: some View {
        
        VStack (spacing: 10){
            
            HStack {
                player.playerView
                    .frame(width:player.isMiniPlayer ? 150 : player.width, height: player.isMiniPlayer ? 70 :  getFrame())
            }
            //maxHeight: player.isMiniPlayer ? 70 :  getFrame(),
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                
                ViewControls()
            )
            
            GeometryReader { reader in
                
                ScrollView {
                    
                    VStack(spacing: 18) {
                        
                        //video playback details and buttons
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("【苍穹原创】木兰行【忘川风华录】超赞")
                                .font(.callout)
                            
                            Text("346.4万播放 ·1.7万弹幕 \n2020-04-01 10:01:00 全站排行榜最高第3名")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Button
                        HStack {
                            
                            PlayBackVideoButton(image: "hand.thumbsup", text: "123k")
                            
                            PlayBackVideoButton(image: "hand.thumbsdown", text: "1.3k")
                            
                            PlayBackVideoButton(image: "square.and.arrow.up", text: "Share")
                            
                            PlayBackVideoButton(image: "square.and.arrow.down", text: "Download")
                            
                            PlayBackVideoButton(image: "message", text: "Live char")
                        }
                        
                        Divider()
                        
                        VStack(spacing: 15) {
                            
                            ForEach(videos) { video in
                                
                                VideoCardView(video: video)
                            }
                        }
                    }
                    .padding()
                }
                .onAppear(perform: {
                    player.height = reader.frame(in: .global).height + 250
                })
            }
            .background(Color.white)
            .opacity(player.isMiniPlayer ? 0 : getOpacity())
            .frame(height: player.isMiniPlayer ? 0 : nil)
        }
        .background(
            Color.white
                .ignoresSafeArea(.all, edges: .all)
                .onTapGesture {
                    player.width = UIScreen.main.bounds.width
                    player.isMiniPlayer.toggle()
                }
        )
    }
    
    func getFrame()->CGFloat {
        
        let  progress = player.offset / (player.height - 100)
        
        if (1 - progress) <= 1.0 {
            
            let videoHeight : CGFloat = (1 - progress) * 250
            
            if  videoHeight <= 70 {
                
                let percent = videoHeight / 70
                let videoWidth : CGFloat = percent * UIScreen.main.bounds.width
                DispatchQueue.main.async {
                    player.width = videoWidth
                }
                return 70
            }
            
            DispatchQueue.main.async {
                
                player.width = UIScreen.main.bounds.width
            }
            
            return videoHeight
        }
        
        return 250
    }
    
    func getOpacity() ->Double{
        
        let progress = player.offset / (player.height)
        if progress < 1 {
            return Double(1 - progress)
        }
        return 1;
    }
    
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PlayBackVideoButton: View {
    
    var image : String
    var text : String
    
    var body: some View {
        Button(action: {}, label: {
            
            VStack(spacing: 8) {
                
                Image(systemName: image)
                    .font(.title3)
                
                Text(text)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        })
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
    }
}

struct ViewControls : View {
    
    @EnvironmentObject var player : VideoPlayerViewModel
    var body: some View {
        
        HStack (spacing: 15){
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150, height: 70)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("【苍穹原创】木兰行【忘川风华录】超赞")
                    .font(.callout)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text("Kavsoft")
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundColor(.gray)
            })
            
            
            
            Button(action: {
                
                
                
            }, label: {
                
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            })
            
            Button(action: {
                
//                withAnimation {
                    player.showPlayer.toggle()
                    player.offset = 0
                    player.isMiniPlayer.toggle()
//                }
                
            }, label: {
                
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            })
        }
        .padding(.trailing)
    }
}
