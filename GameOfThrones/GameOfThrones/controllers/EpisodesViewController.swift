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
//  type 'prepare' to autocomplete. must be inside view controller class. needed to prepare the appropriate view set up for the clicked cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //Assign these 2 things into a Variable:
            //get the indexPath
            //get the destination (EpisodeSummaryViewController)
        
        guard let toTheViewControllerWeWant = segue.destination as?  EpisodeSummaryViewController,
              let indexPath = tableView.indexPathForSelectedRow  else { return }
        
        //get the "GOTEpisode" using the indexPath
        let episode: GOTEpisode = episodeSections[indexPath.section][indexPath.row]
        
        //assign the "GOTEpisode" we got here into the "episode" variable in the EpisodeSummaryViewController
        toTheViewControllerWeWant.episode = episode
    }
    
    
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
    
    //set title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GOT Season \(section + 1)"
    }

    //cell (required)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //set sections odd to use left image cell and even to right image cell
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? LeftImageCell else { fatalError("could not deque the leftImageCell")}
            
            let episode = episodeSections[indexPath.section][indexPath.row]
            cell.episodeName.text = String(episode.name)
            cell.episodeSeason.text = String(episode.season)
            cell.leftImage.image = UIImage(named:episode.mediumImageID)
            return cell
        } else {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? RightImageCell else { fatalError("could not deque the rightImageCell")}
            
            let episode = episodeSections[indexPath.section][indexPath.row]
            cell2.episodeName.text = String(episode.name)
            cell2.episodeSeason.text = String(episode.season)
            cell2.rightImage.image = UIImage(named: episode.originalImageID)
            return cell2
            
        }
    }
    
}

//another protocol to setup the table view
extension EpisodesViewController: UITableViewDelegate {
    
    //define the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
