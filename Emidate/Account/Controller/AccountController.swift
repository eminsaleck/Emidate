//
//  AccountController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class AccountController: UIViewController {
    let sections = Bundle.main.decode([ProfileSection].self, from: "modelProfile.json")

    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .whiteApple
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .whiteApple
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private var contentSize: CGSize{
        CGSize(width: view.frame.width, height: view.frame.height + 10)
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteApple
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        setupProfileView()
        setupGeneralView()
        setupConstraints()
        
    }
    
    
}

extension AccountController{
    
    private func setupProfileView(){
        let view = ProfileView()
        view.setup(sections[0].items[0])
        stackView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.3),
            view.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width)
        ])
    }
    
    private func setupGeneralView(){
        let view = UIView()
        stackView.addArrangedSubview(view)
        view.backgroundColor = .tabBarItemAccent
        view.layer.cornerRadius = 30
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.6),
            view.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width)
        ])
    }
    
    private func setupConstraints(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),

        ])

    }
}

