//
//  Song.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/29/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation


class Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        if lhs.title != rhs.title { return false }
        if lhs.artist != rhs.artist { return false }
        return true
    }
    
    
    var title: String
    var artist: String
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}









