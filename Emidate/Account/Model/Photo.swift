//
//  Photo.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 13.10.2022.
//

import Foundation
import UIKit

// MARK: - WelcomeElement
struct Photo: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

extension Photo: Displayable{
    var imageURL: String {
        downloadURL
    }
}
