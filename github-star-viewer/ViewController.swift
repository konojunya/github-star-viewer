//
//  ViewController.swift
//  github-star-viewer
//
//  Created by konojunya on 2017/10/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit
import Foundation
import APIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repositories = [GithubRepository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 75
//        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.fetchRepositories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchRepositories() {
        let request = FetchRepositoriesRequest()
        Session.send(request) {result in
            switch result {
            case .success(let githubRepositories):
                self.repositories = githubRepositories
                self.tableView.reloadData()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GithubRepositoryTableViewCell
        cell.setCell(repository: self.repositories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showReadme", sender: self)
    }


}

