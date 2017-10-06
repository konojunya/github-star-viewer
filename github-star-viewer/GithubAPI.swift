//
//  GithubAPI.swift
//  github-star-viewer
//
//  Created by konojunya on 2017/10/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import APIKit
import ObjectMapper

protocol GithubRequest: Request {
    
}

extension GithubRequest {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
}

struct FetchRepositoriesRequest: GithubRequest {
    
    typealias Response = [GithubRepository]
    
    var path: String {
        return "/users/konojunya/starred"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> FetchRepositoriesRequest.Response {
        return Mapper<GithubRepository>().mapArray(JSONObject: object)!
    }
    
}
