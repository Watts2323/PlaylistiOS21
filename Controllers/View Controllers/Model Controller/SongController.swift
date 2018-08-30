//
//  SongController.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/30/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation

class SongController {
    
    static func addSong(title: String, artist: String, from playlist: Playlist) {
        //line 15 is an instance of Song
        let song = Song(title: title, artist: artist)
        PlaylistController.sharedInstance.createSong(song: song, from: playlist)
    }
    
    static func deleteSong(from playlist: Playlist, song: Song) {
        //We want to get a position of song ("Index)
       guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
    }
}








