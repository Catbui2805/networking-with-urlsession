//
//  MusicItem.swift
//  MusicFetcher
//
//  Created by Nguyen Tran on 8/16/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import Foundation

struct MusicItem: Codable, Identifiable {
    let id: Int
    let artistName: String
    let trackName: String
    let collectionName: String
    let previewUrl: String
    let artwork: String
    
    enum CodingKeys: String, CodingKey {
        case id = "artistId"
        case artistName
        case trackName
        case collectionName
        case previewUrl
        case artwork = "artworkUrl100"
    }
}
