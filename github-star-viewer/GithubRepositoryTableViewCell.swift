//
//  TableViewCell.swift
//  github-star-viewer
//
//  Created by konojunya on 2017/10/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit
import AlamofireImage

class GithubRepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avaterIcon: UIImageView!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(repository: GithubRepository) {
        self.avaterIcon.af_setImage(withURL: URL.init(string: (repository.user?.avatarUrl)!)!)
        self.repositoryName.text = repository.name
        self.ownerName.text = repository.user?.name
    }
    
}
