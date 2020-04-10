//
//  Card.swift
//  ToDo
//
//  Created by Cloud on 2020/04/09.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct ToDoData: Codable {
    
    struct Category: Codable {
        
        struct Card: Codable {
            var id: Int
            var contents: String
        }
        
        var id: Int
        var title: String
        var cards: [Card]
    }
    
    var id: Int
    var title: String
    var categories: [Category]
}
