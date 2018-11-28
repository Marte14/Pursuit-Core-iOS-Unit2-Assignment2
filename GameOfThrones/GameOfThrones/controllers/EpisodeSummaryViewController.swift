//
//  EpisodeSummaryViewController.swift
//  GameOfThrones
//
//  Created by katty y marte on 11/26/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EpisodeSummaryViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    
    @IBOutlet weak var seasonNumber: UILabel!
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    @IBOutlet weak var runTime: UILabel!
    
    @IBOutlet weak var airDate: UILabel!
    
    
    @IBOutlet weak var episodeSummary: UITextView!
   //contains an instance of a game of throne episode
    var episode : GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodeImage.image = UIImage.init(named:episode.originalImageID)
        episodeName.text = episode.name
        seasonNumber.text = String(episode.season)
        episodeNumber.text = String(episode.number)
        runTime.text = String(episode.runtime)
        airDate.text = String(episode.airdate)
        episodeSummary.text = episode.summary
        
    
    
    }
}
