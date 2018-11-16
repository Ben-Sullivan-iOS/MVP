//
//  ViewController.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

protocol CompetitionsVCDelegate: class {
    func modelDataUpdated(competitions: [Competition])
}

class CompetitionsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: CompetitionsVCPresenterType?
    private var competitions: [Competition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CompetitionsVCPresenter(delegate: self)
    }

}

extension CompetitionsVC: CompetitionsVCDelegate {
    
    func modelDataUpdated(competitions: [Competition]) {
        self.competitions = competitions
        tableView.reloadData()
    }
    
}

extension CompetitionsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return competitions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitions[section].matches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchCell.identifier, for: indexPath) as! MatchCell
        
        if let match = competitions[indexPath.section].matches?[indexPath.row] {
            cell.configure(withMatch: match)
        }
        
        return cell
    }
}

extension CompetitionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return competitions[section].name
    }
}
