//
//  a.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import Foundation
import UIKit

struct Profile: Decodable, Hashable {
    let name: String
    let image: String
    let location: String
    let time: String
    let matches: String
    let likes: String
}
