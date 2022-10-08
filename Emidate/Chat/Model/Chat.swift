//
//  Chat.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import Foundation
import UIKit

struct Chat: Decodable, Hashable {
    let name: String
    let image: String
    let lastMessage: String
    let time: String
    let isNew: String
}
