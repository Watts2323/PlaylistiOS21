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
    
    init() {
        self.playlists = load()
    }
    
    //Create
    /// This creates a brand new Playlist- and adds it to our SOURCE OF TRUTH!
    func create(title: String) {
        //line 29 is an instance of playlist
        let playlist = Playlist(title: title)
        playlists.append(playlist)
        save()
    }
    
    func createSong(song: Song, from playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    //Read
    
    //Update
    func updateViews() {
        
    }
    
    //Delete
    func delete(playlistToDelete: Playlist) {
        
        guard let index = playlists.index(of: playlistToDelete) else { return }
        playlists.remove(at: index)
        save()
    }
    
    //MARK: Save and load
    
    //This is our train track to where we can save
    func fileUrl() -> URL? {
        // Thus ius the class where we are saving to
        // this is saving to the actual IPHONE
        let fileManager = FileManager.default
        // this is the locations of there we can save it
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        // This is the one location (Path)
        guard let url = urls.first else { return nil }
        // This is our final custom Path
        let playlistPath = "playlistApp.json"
        let destinationURL = url.appendingPathComponent(playlistPath)
        return url.appendingPathComponent(playlistPath)
        print("\(destinationURL)")
        return destinationURL
    }
    
    
    func save() {
        let encoder = JSONEncoder()
        do {
        let data = try encoder.encode(playlists)
            guard let fileUrl = fileUrl() else { return }
            try data.write(to: fileUrl)
            
        } catch let error {
            print("Error saving to file \(#function) \(error) \(error.localizedDescription)")
            
        }
    }
    
    func load() -> [Playlist] {
        let decoder = JSONDecoder()
        
        do {
            guard let fileUrl = fileUrl() else { return [] }
            let data = try Data(contentsOf: fileUrl)
            let playlists = try decoder.decode([Playlist].self, from: data)
            return playlists
        } catch let error {
            print("Error loading playlist \(error) \(error.localizedDescription)")
            return []
        }
    }
}








