//
//  PlayersViewController.swift
//  MVCDemo
//
//  Created by Adaps on 10/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    ///MARK  : -  Storyboard outlets
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    ///MARK  : -  custom outlets
    var countryData:TeamCellModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.lblTeamName.text = (countryData?.countryName.capitalizingFirstLetter())
    }
    
    /// Mark :- setup Tableview
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "PlayersTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayersTableViewCell")
    }
}


/// Mark : - UITableViewDelegate Methods

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData?.playersList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell", for: indexPath) as! PlayersTableViewCell
        cell.item = self.countryData?.playersList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
