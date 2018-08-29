//
//  Playlist.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/29/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    // now we can compair playlits and have access to helper methods
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        if lhs.title != rhs.title {return false }
        if lhs.songs != rhs.songs { return false }
        return true
    }
    
    var title: String
    var songs: [Song] = []
    
    init(title: String, songs: [Song] = []) {
        self.title = title
        self.songs = songs
    }
}
























