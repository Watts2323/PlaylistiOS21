//
//  PlaylistController.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/29/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

// 1) CRUD
// 2) Singleton
// 2a) Shared Instance
// 3) SOURCE OF TRUTH

import Foundation

class PlaylistController {
    
    //Singleton design patter - We create one initialized class si we can access it throughout our project.
    /// Singelton: Prevents two instances to reach your variables and methods. It creates only ONE instance to give you access to it's instance method and variables.
    // This will only happen once in our app
    static let sharedInstance = PlaylistController()
    
    //Source OF TRUTH! how you populate app, how u delete something, how you add something.
    var playlists: [Playlist] = []
    
    //Create
    /// This creates a brand new Playlist- and adds it to our SOURCE OF TRUTH!
    func create(title: String) {
        //line 29 is an instance of playlist
        let playlist = Playlist(title: title)
        playlists.append(playlist)
    }
    
    //Read
    
    //Update
    func updateViews() {
        
    }
    
    //Delete
    func delete(playlistToDelete: Playlist) {
        
        guard let index = playlists.index(of: playlistToDelete) else { return }
        playlists.remove(at: index)
    }
}








