//
//  ChatCell.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class ChatCell: UICollectionViewListCell {
    
    static var reuseId: String = "chatCell"

    var isNew: Bool?
    
    let imageView = UIImageView()
    let name = UILabel()
    let lastMessage = UILabel()
    let timeLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
        backgroundColor = UIColor(white: 1, alpha: 1)
       
        setupElements()
        setupConstraints()
        self.backgroundColor = UIColor.chatColor
       
        
            
        
    }
    
    func setupElements() {
        name.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with chat: Chat) {
        name.text = chat.name
        timeLabel.text = chat.time
        lastMessage.text = chat.lastMessage
        imageView.image = UIImage(named: chat.image)
        isNew = Bool(chat.isNew)!
        notification()
        
    }
    func setupFont(){
        name.font = UIFont.boldSystemFont(ofSize: 16)
        lastMessage.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .light)
        timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: .thin)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCell {
    func notification(){
        if isNew ?? false {
        contentView.layer.addSublayer(createLayer())
        }
    }
    
    func createLayer() -> CAShapeLayer{
        contentView.backgroundColor = #colorLiteral(red: 0.8182724118, green: 1, blue: 0.9826992154, alpha: 0.3959130527)
        contentView.layer.zPosition = 1
        
        let notificationLayer = CAShapeLayer()
        notificationLayer.path = UIBezierPath(roundedRect: CGRect(x: 320, y: 35, width: 10, height: 10), cornerRadius: 5).cgPath
        notificationLayer.fillColor = UIColor.tabBarItemAccent.cgColor
        
        notificationLayer.opacity = 1

        let contactRect = CGRect(x: 320, y: 36, width: 10, height: 10)
        notificationLayer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        notificationLayer.shadowRadius = 10
        notificationLayer.shadowColor = UIColor.tabBarItemLight.cgColor
        notificationLayer.shadowOpacity = 1
        
        return notificationLayer
    }
    
    func setupConstraints() {

    
        self.layer.cornerRadius = 10
      
        self.clipsToBounds = true
        
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 31
        
        imageView.layer.zPosition = 2
        lastMessage.layer.zPosition = 2
        timeLabel.layer.zPosition = 2
        name.layer.zPosition = 2
        
        addSubview(imageView)
        addSubview(name)
        addSubview(lastMessage)
        addSubview(timeLabel)
        
        
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     imageView.widthAnchor.constraint(equalToConstant: 62),
                                     imageView.heightAnchor.constraint(equalToConstant: 62),
                                     
                                     name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                                     name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                     
                                     lastMessage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                                     lastMessage.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                     
                                     timeLabel.topAnchor.constraint(equalTo: name.centerYAnchor, constant: -9),
                                     timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
                                     
                                     
        ])



    }
}
