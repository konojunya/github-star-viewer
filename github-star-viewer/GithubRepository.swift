//
//  GithubRepository.swift
//  github-star-viewer
//
//  Created by konojunya on 2017/10/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import ObjectMapper

class GithubRepository: Mappable {
    var id: Int?
    var name: String?
    var user: GithubUser?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.user <- map["owner"]
    }
}

class GithubUser: Mappable {
    var name: String?
    var avatarUrl: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.name <- map["login"]
        self.avatarUrl <- map["avatar_url"]
    }
}
