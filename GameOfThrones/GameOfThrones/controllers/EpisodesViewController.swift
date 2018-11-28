//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {
 // GOTEpisode.allEpisodes access for all episodes
    private var episodeSections = [[GOTEpisode]]()//accessing episodes per season , not all
    @IBOutlet weak var tableView: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self  // why is this? and below
    tableView.delegate = self
    episodeSections = Array(repeating: [GOTEpisode](), count: GOTEpisode.allEpisodes.last!.season)
    GOTEpisode.allEpisodes.forEach { episodeSections[$0.season - 1].append($0)}

  }
  //type 'prepare' to autocomplete. must be inside view controller class. needed to prepare the appropriate view set up for the clicked cell
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        guard let destination = segue.destination as?  EpisodeSummaryViewController, let chosenEpisode = tableView.indexPathForSelectedRow else { return }
//            var selection = episodeSections[chosenEpisode.row]
//            destination.episode! = selection
//    }
//    
    
}

//setup the Table View
extension EpisodesViewController : UITableViewDataSource {

    //number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
       return episodeSections.count
    }

//    //number of rows (required)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return episodeSections[section].count
    }

    //cell (required)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? LeftImageCell
        
        else { fatalError("could not deque the leftImageCell")}
        let episode = episodeSections[indexPath.section][indexPath.row]
        cell.episodeName.text = String(episode.name)
        cell.episodeSeason.text = String(episode.season)
        cell.leftImage.image = UIImage(named:episode.mediumImageID)
        return cell
    }
}


//another protocol to setup the table view
extension EpisodesViewController: UITableViewDelegate {
    
    //define the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
