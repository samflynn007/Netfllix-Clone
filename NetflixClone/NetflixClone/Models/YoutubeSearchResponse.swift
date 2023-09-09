//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Venky on 08/09/23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
