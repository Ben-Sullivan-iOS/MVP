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
    
    var presenter = CompetitionsVCPresenter()
    var competitions: [Competition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
    }

}

extension CompetitionsVC: CompetitionsVCDelegate {
    
    func modelDataUpdated(competitions: [Competition]) {
        self.competitions = competitions
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
