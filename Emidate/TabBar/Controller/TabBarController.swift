//
//  MainTabBarController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit
class TabBarController: UITabBarController {
    
    var customTabBar: TabMenu!
    var tabBarHeight: CGFloat = 50.0
    var viewWhite: UIView = {
       let view = UIView()
        view.backgroundColor = .whiteApple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
        
    }
    
    private func loadTabBar() {
     
        let tabItems: [TabItem] = [.feed, .topAccount, .main, .chat, .account]
        self.setupCustomTabMenu(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        self.selectedIndex = 0
        
    }
    
    private func setupCustomTabMenu(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        self.customTabBar = TabMenu(menuItems: items, frame: frame)
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.customTabBar.clipsToBounds = true
        self.customTabBar.itemTapped = self.changeTab

        self.view.addSubview(customTabBar)
        self.view.addSubview(viewWhite)


        NSLayoutConstraint.activate([
            viewWhite.bottomAnchor.constraint(equalTo: customTabBar.topAnchor),
            viewWhite.topAnchor.constraint(equalTo: view.topAnchor),
            viewWhite.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewWhite.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 7),
            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
           // self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController)
        }
        self.view.layoutIfNeeded()
        completion(controllers) 
    }
    private func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}



