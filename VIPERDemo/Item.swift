//
//  Item.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import Foundation

struct Item: Codable {
    let id: Int?
    let title: String?
    let price: Double
    let description: String?
    let category: Category?
    let image: URL?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case description
        case category, image
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}


