//
//  Chat.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import Foundation
import UIKit

struct Chat: Decodable, Hashable {
    let friendName: String
    let friendImage: String
    let lastMessage: String
}
