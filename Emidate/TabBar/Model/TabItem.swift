//
//  TabItem.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit
enum TabItem: String, CaseIterable {
    
    case feed = "feed"
    case topAccount = "topAccount"
    case main = "main"
    case chat = "chat"
    case account = "account"
    
    var viewController: UIViewController {
        switch self {
        case .feed:
            return FeedController()
        case .topAccount:
            return TopAcountsController()
        case .main:
            return MainController()
        case .chat:
            return ChatController()
        case .account:
            return AccountController()
        }
        
    }

    var icon: UIImage {
        switch self {
        case .feed:
            return UIImage(named: "feed")!
            
        case .topAccount:
            return UIImage(named: "topAccount")!
        case .main:
            return UIImage(named: "main")!
        case .chat:
            return UIImage(named: "chat")!
        case .account:
            return UIImage(named: "profile")!
        }
    }
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
