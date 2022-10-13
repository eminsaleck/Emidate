//
//  MainController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit
import Alamofire

let apiKey = "VuXOyYkiBeutJaPRBwVj_g"


class MainController: UIViewController {

    var viewModelData: [CardsDataModel] = []
    
    var stackContainer : StackContainerView!
    
    
    let buttonsContainer: ButtonsView = {
        let view = ButtonsView()
        
        return view
    }()

    
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
        print(viewModelData)
        fetchData()
    }

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
        card.bottomCardView.setup(viewModelData[index])
        card.dataSource = viewModelData[index]
        return card
    }
    
    func emptyView() -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }
    
    
}

extension MainController{
    func fetchData(){
        let parameters = Parameter()
     
        
        AF.request("https://app.fakejson.com/q", method: .post, parameters: parameters).responseJSON { response in
            do{
            let result: CardsDataModel = try JSONDecoder().decode(CardsDataModel.self, from: response.data!)
                print(result)
                self.viewModelData = result.results
                
            }
            catch{
                print("Failed")
            }
               }
    }
}

