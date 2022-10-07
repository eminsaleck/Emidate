//
//  Section.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//


import Foundation

import UIKit

struct Section: Decodable, Hashable {
    let type: String
    let title: String
    let items: [Chat]
}
