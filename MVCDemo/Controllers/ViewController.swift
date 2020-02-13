//
//  ViewController.swift
//  MVCDemo
//
//  Created by Adaps on 06/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// Storyboard outlets

    @IBOutlet weak var tableView: UITableView!
    
    /// custom outlets
    
    var countries = [TeamCellModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getCricketTeams()
        
    }

    /// Mark :- setup Tableview

    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "TeamsTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamsTableViewCell")
    }
    
    func getCricketTeams(){
        
        if CheckInternet.Connection() {
            self.showLoader()
            APIService.shared.GET(endpoint: APIService.Endpoint.getPlayers)     {
                (result: Result<CricketTeams, APIService.APIError>) in
                self.hideLoader()
                switch result {
                case let .success(response):
                    let mirror = Mirror(reflecting: response)
                    for child in mirror.children  {
                        let country = TeamCellModel(countryName: child.label ?? "", playersList: child.value as! [Player])
                        self.countries.append(country)
                    }
                    self.tableView.reloadData()
                case let .failure(error):
                    print(error)
                    break
                }
            }
        } else {
            print("connection is not there")
        }
        
    }
}

/// Mark : - UITableViewDelegate Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as! TeamsTableViewCell
        cell.item = self.countries[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PlayersViewController") as! PlayersViewController
        nextViewController.countryData = self.countries[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
