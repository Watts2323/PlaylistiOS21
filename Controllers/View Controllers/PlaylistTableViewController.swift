//
//  PlaylistTableViewController.swift
//  PlaylistiOSP2
//
//  Created by Xavier on 8/29/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    @IBOutlet weak var playlistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = playlistTextField.text, title != "" else { return }
        PlaylistController.sharedInstance.create(title: title)
        // hEY TABLEvIEW GO DO YOUR JOB AGAIN which is to re-reun your 2 required methods which are number of rows in section and cell for row at
        tableView.reloadData()
        playlistTextField.text = ""
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedInstance.playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        cell.textLabel?.text = playlist.title
        if playlist.songs.count == 1 {
            cell.detailTextLabel?.text = "\(playlist.songs.count) Song"
        } else {
            cell.detailTextLabel?.text = "\(playlist.songs.count) Song's"        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            // Delete the row from the data source
            PlaylistController.sharedInstance.delete(playlistToDelete: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check for segue
        if segue.identifier == "toSongDetail" {
            // get your destination
            let destinationVC = segue.destination as? SongTableViewController
            
            //get users selected row
            guard let  indexPath = tableView.indexPathForSelectedRow else { return }
            //get your object aka playlist
            let playlistSelectedByUser = PlaylistController.sharedInstance.playlists[indexPath.row]
            //Pass the info to your mail box or landing pad
            destinationVC?.playlist = playlistSelectedByUser
        }
    }
}


