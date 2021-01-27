//
//  VideoCardView.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI

struct VideoCardView: View {
    
    var video : Video
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(video.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:250)
                .clipped()
            
            HStack(spacing: 15) {
                Image("album")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipped()
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6, content: {
                    
                    Text(video.title)
                        .fontWeight(.semibold)
                        .font(.callout)
                    
                    HStack {
                        
                        Text("Kavsoft")
                            .fontWeight(.bold)
                            .font(.caption)
                        
                        Text(".12K Views.5 Days Ago")
                            .font(.caption)
                    }
                    .foregroundColor(.gray)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
