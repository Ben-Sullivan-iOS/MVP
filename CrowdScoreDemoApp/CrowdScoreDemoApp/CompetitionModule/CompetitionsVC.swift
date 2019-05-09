//
//  ViewController.swift
//  CrowdScoreDemoApp
//
//  Created by Ben Sullivan on 15/11/2018.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

protocol CompetitionsVCDelegate: class {
  var competitions: [CompetitionRepresentable] { get set }
}

class CompetitionsVC: UIViewController, CompetitionsVCDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var presenter: CompetitionsVCPresenterType?
  
  var competitions: [CompetitionRepresentable] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  init(presenter: CompetitionsVCPresenterType) {
    self.presenter = presenter
    super.init(nibName: "CompetitionsView", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Competitions"
    configureTableView()
    presenter?.onViewDidLoad(view: self)
  }
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "MatchCell", bundle: nil), forCellReuseIdentifier: MatchCell.identifier)
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
