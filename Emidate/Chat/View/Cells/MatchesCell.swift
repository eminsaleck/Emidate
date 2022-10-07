//
//  MatchesCell.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class MatchesCell: UICollectionViewCell {
    
    static var reuseId: String = "matchesCell"
    
    let name = UILabel()
    let imageView = UIImageView()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()
        name.font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupElements() {
        name.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with chat: Chat) {
        name.text = chat.name.components(separatedBy: " ").first
        imageView.image = UIImage(named: chat.image)
    }
    
   
}

extension MatchesCell {
    func setupConstraints() {
        self.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)

        self.clipsToBounds = true
        
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 31
        
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.topAnchor),
                                     imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     imageView.widthAnchor.constraint(equalToConstant: 62),
                                     imageView.heightAnchor.constraint(equalToConstant: 62),
                                     
                                     name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
                                     name.centerXAnchor.constraint(equalTo: self.centerXAnchor
                                                                  ),
                                     ])
        
    }
}
