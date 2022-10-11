//
//  CardsDataModel.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import Foundation

import UIKit
struct CardsDataModel {
    
    var bgColor: UIColor
    var text : String
    var image : String
      
    init(bgColor: UIColor, text: String, image: String) {
        self.bgColor = bgColor
        self.text = text
        self.image = image
    
    }
}


