//
//  SwipeCardDataSource.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import Foundation
import UIKit

protocol SwipeCardsDataSource {
    func numberOfCardsToShow() -> Int
    func card(at index: Int) -> SwipeCardView
    func emptyView() -> UIView?
    
}

protocol SwipeCardsDelegate {
    func swipeDidEnd(on view: SwipeCardView, loveOrHate: Bool)
    
}


