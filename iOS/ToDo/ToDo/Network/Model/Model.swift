//
//  Model.swift
//  ToDo
//
//  Created by Cloud on 2020/04/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol Projectable {
    var categories: [Category] { get }
}

protocol Categoriable {
    var id: Int { get }
    var cards: [Card] { get set }
}
struct Card: Codable {
    let id: Int
    let title: String
    let contents: String
    let categoryKey: Int
}

struct Contents: Codable {
    let title: String
    let contents: String
}

struct Category: Categoriable ,Codable {
    var id: Int
    let title: String
    var cards: [Card]
    let position: Int
}

struct TodoProject: Projectable, Codable {
    let id: Int
    let title: String
    let categories: [Category]
}


