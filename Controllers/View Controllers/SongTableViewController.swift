//
//  SongTableViewController.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/29/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var songTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var playlist: Playlist?

    @IBAction func addSongButtonTapped(_ sender: UIBarButtonItem) {
        guard let artistFromTextField = artistTextField.text,
            let songFromTextField = songTextField.text, let playlist = playlist else { return }
        
        SongController.addSong(title: songFromTextField, artist: artistFromTextField, from: playlist)
        
        //Hey you. tableView. go do your job again- re run your data source
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = playlist?.songs[indexPath.row]
        
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist

        // Configure the cell...

        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let playlist = playlist else { return }
                let song = playlist.songs[indexPath.row]
                
                
            SongController.deleteSong(from: playlist, song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "toSongDetail"
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
