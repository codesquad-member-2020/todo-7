//
//  Service.swift
//  ToDo
//
//  Created by Cloud on 2020/04/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Service {
    
    static var baseURLRequest: URLRequest {
        let urlString = "http://ec2-34-236-160-204.compute-1.amazonaws.com:8080/projects/1"
        guard let url = URL(string: urlString) else {
            assertionFailure("\(urlString) dosen't exist!")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }
    
    static func deleteURLRequset(_ categoryId: Int, _ cardId: Int) -> URLRequest {
        let urlString = "http://ec2-34-236-160-204.compute-1.amazonaws.com:8080/projects/1/categories/\(categoryId)/cards/\(cardId)"
        guard let url = URL(string: urlString) else {
            assertionFailure("\(urlString) Failed")
            return URLRequest(url: URL(string: "")!)
        }
        let request: URLRequest = {
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            return request
        }()
        return request
    }
}

