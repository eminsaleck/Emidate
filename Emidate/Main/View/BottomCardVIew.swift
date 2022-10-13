//
//  BottomCardVIew.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import UIKit

class BottomCardView: UIView {
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let workLabel: UILabel = {
        let workLabel = UILabel()
        workLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        workLabel.font = UIFont.boldSystemFont(ofSize: 14)
        workLabel.translatesAutoresizingMaskIntoConstraints = false
        return workLabel
    }()
    
    let workImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "work")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let homeLabel: UILabel = {
        let homeLabel = UILabel()
        homeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        homeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        return homeLabel
    }()
    
    let bookLabel: UILabel = {
        let bookLabel = UILabel()
        bookLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bookLabel.font = UIFont.boldSystemFont(ofSize: 14)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        return bookLabel
    }()
    
    let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "book")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        locationLabel.font = UIFont.boldSystemFont(ofSize: 14)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        exampleInfo()
        configure()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ item: Profile) {
        
    }
    func exampleInfo(){
        nameLabel.text = "Maria Graham"
        workLabel.text = "Tatto artist"
        homeLabel.text = "Kyiv"
        bookLabel.text = "KNUCA"
        locationLabel.text = "2 km away"
    }
}


extension BottomCardView {
    func configure(){
        
        addSubview(view)
         
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor)
        ])

    }
    func setupConstraints() {
        
        self.clipsToBounds = true

        nameLabel.layoutIfNeeded()
        nameLabel.layer.masksToBounds = true
        workLabel.layoutIfNeeded()
        workLabel.layer.masksToBounds = true
        
        addSubview(nameLabel)
        addSubview(workLabel)
        addSubview(workImageView)
        addSubview(homeImageView)
        addSubview(homeLabel)
        addSubview(bookLabel)
        addSubview(bookImageView)
        addSubview(locationLabel)
        addSubview(locationImageView)

        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            workLabel.topAnchor.constraint(equalTo: workImageView.topAnchor),
            workLabel.leftAnchor.constraint(equalTo: workImageView.rightAnchor, constant: 5),
            workImageView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            workImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
          
            homeImageView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            homeImageView.topAnchor.constraint(equalTo: workImageView.bottomAnchor, constant: 20),
            homeLabel.topAnchor.constraint(equalTo: homeImageView.topAnchor),
            homeLabel.leftAnchor.constraint(equalTo: homeImageView.rightAnchor, constant: 5),
            
            
            bookLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90),
            bookLabel.topAnchor.constraint(equalTo: workLabel.topAnchor),
            bookImageView.topAnchor.constraint(equalTo: workImageView.topAnchor),
            bookImageView.trailingAnchor.constraint(equalTo: bookLabel.leadingAnchor, constant: -5),
            
            locationImageView.leftAnchor.constraint(equalTo: bookImageView.leftAnchor),
            locationImageView.topAnchor.constraint(equalTo: homeImageView.topAnchor),
            locationLabel.leftAnchor.constraint(equalTo: locationImageView.leftAnchor, constant: 20),
            locationLabel.topAnchor.constraint(equalTo: locationImageView.topAnchor)
        ])
    }
}
