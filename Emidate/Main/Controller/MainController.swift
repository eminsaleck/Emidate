//
//  MainController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class MainController: UIViewController {
 
    
    
    //MARK: - Properties
    var viewModelData = [CardsDataModel(image: "human1"),
                         CardsDataModel(image: "2"),
                         CardsDataModel(image: "2"),
                         CardsDataModel(image: "3"),
                         CardsDataModel(image: "4"),
                         CardsDataModel(image: "1")]
    
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
        stackContainer.heightAnchor.constraint(equalToConstant: 670).isActive = true
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
