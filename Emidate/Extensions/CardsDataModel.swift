//
//  CardsDataModel.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import Foundation

import UIKit

struct CardsDataModel: Codable {
    var image: String

    var name: String
    var work: String
    var home: String
    var book: String
    var location: String

    var results: [CardsDataModel]
}


struct Parameter: Encodable {
     let token: String = "VuXOyYkiBeutJaPRBwVj_g"
     let data: Dictionary = [
        "name": "Emin Saleck",
        "work": "software developer",
        "home": "Kyiv",
        "book": "PJATK",
        "image": "https://picsum.photos/200/300",
        "location": "location",

     ]
}

struct CardsData: Codable{
    var image: String

    var name: String
    var work: String
    var home: String
    var book: String
    var location: String
}
