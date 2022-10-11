//
//  BottomCardVIew.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import UIKit

class BottomCardView: UIView {
    
    var imageView = UIImageView()
    var name = UILabel()
    
    
    var matches = UILabel()
    var matchesCount = UILabel()
    
    var likes = UILabel()
    var likesCount = UILabel()
    
    
    var bio = UILabel()
    var location = UILabel()
    
    var locationImage = UIImageView()

    let view: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ item: Profile) {
        imageView.image = UIImage(named: item.image)
        matchesCount.text = item.matches
        likesCount.text = item.likes
        bio.text = item.bio
        location.text = item.location
        name.text = item.name
    }
    
    func configure(){
        
       
        
        addSubview(view)
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false

        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor)
        ])
        
    }
    
}


extension BottomCardView {
    func setupConstraints() {
        self.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        
        self.clipsToBounds = true
       
        
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 65
        
        
        name.layoutIfNeeded()
        name.layer.masksToBounds = true
        
        matches.layer.masksToBounds = true
        matches.layoutIfNeeded()
        
        likes.layer.masksToBounds = true
        likesCount.layoutIfNeeded()
        
        bio.layer.masksToBounds = true
        
        location.layoutIfNeeded()
        location.layer.masksToBounds = true
        
        locationImage.layoutIfNeeded()
        locationImage.layer.masksToBounds = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        matches.translatesAutoresizingMaskIntoConstraints = false
        matchesCount.translatesAutoresizingMaskIntoConstraints = false
        likes.translatesAutoresizingMaskIntoConstraints = false
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        bio.translatesAutoresizingMaskIntoConstraints = false
        location.translatesAutoresizingMaskIntoConstraints = false
        locationImage.translatesAutoresizingMaskIntoConstraints = false

      
        bio.numberOfLines = 3
        bio.textAlignment = .center
        
        bio.sizeToFit()
        
        self.addSubview(imageView)
        self.addSubview(name)
        self.addSubview(matches)
        self.addSubview(matchesCount)
        self.addSubview(likes)
        self.addSubview(likesCount)
        self.addSubview(bio)
        self.addSubview(location)
        self.addSubview(locationImage)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.topAnchor),
                                     imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     imageView.widthAnchor.constraint(equalToConstant: 130),
                                     imageView.heightAnchor.constraint(equalToConstant: 130),
                                     
                                     name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
                                     name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     
                                     matches.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35 ),
                                     matches.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 30),
                                     
                                     matchesCount.bottomAnchor.constraint(equalTo: matches.topAnchor, constant: -5 ),
                                     matchesCount.centerXAnchor.constraint(equalTo: matches.centerXAnchor),
                                     
                                     likes.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
                                     likes.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 30),
                                     
                                     likesCount.bottomAnchor.constraint(equalTo: likes.topAnchor, constant: -5 ),
                                     likesCount.centerXAnchor.constraint(equalTo: likes.centerXAnchor),
                                     
                                     bio.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                                     bio.centerXAnchor.constraint(equalTo: name.centerXAnchor),
                                     bio.widthAnchor.constraint(equalToConstant: 210),
                                     
                                     location.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 30),
                                     location.centerXAnchor.constraint(equalTo: bio.centerXAnchor, constant:  5),
                                     
                                     locationImage.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 30),
                                     locationImage.trailingAnchor.constraint(equalTo: location.leadingAnchor),
                                     locationImage.centerYAnchor.constraint(equalTo: location.centerYAnchor)
                                     
                                    ])
    }
}
