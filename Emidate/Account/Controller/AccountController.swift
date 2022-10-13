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
        scrollView.decelerationRate = .normal
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    
    lazy var photoView: PhotoViewController = {
        let tv = PhotoViewController()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
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
        CGSize(width: view.frame.width, height: view.frame.height + 60)
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
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.6),
            view.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width)
        ])
    }

    private func setupGeneralView(){
        let collectionView = photoView
        stackView.addArrangedSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.19),
            collectionView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width)
        ])
    }

    private func setupConstraints(){

        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
     
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                                            , constant: 74),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),

        ])

    }
}

