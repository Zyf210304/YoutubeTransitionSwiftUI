//
//  Video.swift
//  YoutubeTransition
//
//  Created by 亚飞 on 2021/1/27.
//

import SwiftUI

struct Video : Identifiable {
    
    var id = UUID().uuidString
    var image : String
    var title : String
    
}

var videos = [
    
    Video(image: "mulan", title: "Advanced Map Kit Tutorials"),
    Video(image: "onePiece1", title: "Realm DB CRUD Operations"),
    Video(image: "onePiece4", title: "SwiftUI complex Chat App UI"),
    Video(image: "onePiece3", title: "Animation Stricky Header"),
    Video(image: "onePiece2", title: "Shared App For Both macOS And iOS"),
    
]
