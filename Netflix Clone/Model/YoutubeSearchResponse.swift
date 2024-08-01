//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 31.07.2024.
//

import Foundation


//
//items =     (
//            {
//        etag = TiItlXvYxWCoC2x3tt00UHP6MbI;
//        id =             {
//            kind = "youtube#video";
//            videoId = "6-7_fc7wU9U";
//        };
//        kind = "youtube#searchResult";
//    },

struct YoutubeSearchResponse:Codable {
    
    let items: [VideoElement]

}


struct VideoElement: Codable {
    
    let id: IdVideoElement
    
}


struct IdVideoElement:Codable {
    let kind: String
    let videoId: String
    
}
