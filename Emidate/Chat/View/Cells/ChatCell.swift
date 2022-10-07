//
//  ChatCell.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class ChatCell: UICollectionViewListCell {
    
    static var reuseId: String = "chatCell"
    
    let imageView = UIImageView()
    let name = UILabel()
    let lastMessage = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
       
        setupElements()
        setupConstraints()
        self.backgroundColor = UIColor.chatColor
       
    }
    
    func setupElements() {
        name.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with chat: Chat) {
        name.text = chat.name
        lastMessage.text = chat.lastMessage
        imageView.image = UIImage(named: chat.image)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCell {
    func setupConstraints() {

    
        self.layer.cornerRadius = 10
      
        self.clipsToBounds = true
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
        addSubview(imageView)
        addSubview(name)
        addSubview(lastMessage)
        
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     imageView.widthAnchor.constraint(equalToConstant: 78),
                                     imageView.heightAnchor.constraint(equalToConstant: 78),
                                     
                                     name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                                     name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                     
                                     lastMessage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                                     lastMessage.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16)
        ])



    }
}
