//
//  MatchCell.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {
    
    @IBOutlet weak var kickoffLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    
    func configure(withMatch match: Match) {
        kickoffLabel.text = match.kickOffTime
        homeLabel.text = match.homeTeam.shortName
        awayLabel.text = match.awayTeam.shortName
    }
}
