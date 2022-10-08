//
//  ProfileSection.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

struct ProfileSection: Decodable, Hashable {

    let type: String
    let title: String
    let items: [Profile]
}
