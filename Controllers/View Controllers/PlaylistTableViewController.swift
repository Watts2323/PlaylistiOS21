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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
