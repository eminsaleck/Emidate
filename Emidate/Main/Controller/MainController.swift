//
//  MainController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class MainController: UIViewController {
 
    
    
    //MARK: - Properties
    var viewModelData = [CardsDataModel(bgColor: UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0), text: "Hamburger", image: "human1"),
                         CardsDataModel(bgColor: UIColor(red:0.29, green:0.64, blue:0.96, alpha:1.0), text: "1", image: "2"),
                         CardsDataModel(bgColor: UIColor(red:0.29, green:0.63, blue:0.49, alpha:1.0), text: "1", image: "2"),
                         CardsDataModel(bgColor: UIColor(red:0.69, green:0.52, blue:0.38, alpha:1.0), text: "1", image: "3"),
                         CardsDataModel(bgColor: UIColor(red:0.90, green:0.99, blue:0.97, alpha:1.0), text: "1", image: "4"),
                         CardsDataModel(bgColor: UIColor(red:0.83, green:0.82, blue:0.69, alpha:1.0), text: "Robot", image: "1")]
    
    var stackContainer : StackContainerView!
    
    let buttonsContainer: ButtonsView = {
        let view = ButtonsView()
        
        return view
    }()
    
    //MARK: - Init
    
    override func loadView() {
        
        
        view = UIView()
        view.backgroundColor = UIColor.whiteApple
        stackContainer = StackContainerView()
        view.addSubview(stackContainer)
        
        configureStackContainer()
        
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expense Tracker"
        stackContainer.dataSource = self
        
        
    }
    
    
    //MARK: - Configurations

    func configureStackContainer() {
        
        stackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        stackContainer.widthAnchor.constraint(equalToConstant: 350).isActive = true
        stackContainer.heightAnchor.constraint(equalToConstant: 630).isActive = true
    }
    
}

extension MainController : SwipeCardsDataSource {
    
    func numberOfCardsToShow() -> Int {
        return viewModelData.count
    }
    
    func card(at index: Int) -> SwipeCardView {
        let card = SwipeCardView()
        card.dataSource = viewModelData[index]
        return card
    }
    
    func emptyView() -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }
    
    
}
