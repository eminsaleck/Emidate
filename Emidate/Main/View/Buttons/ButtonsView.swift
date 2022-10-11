//
//  File.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 11.10.2022.
//

import Foundation
import UIKit

class ButtonsView: UIView {
    
    weak var delegate: ButtonsDelegate?
    
    lazy var likeButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "back"), cornerRadius: 0, target: self, selector: #selector(like), sizeToFit: true).new
        
        return b
    }()
    
    lazy var passButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "no"), cornerRadius: 0, target: self, selector: #selector(pass), sizeToFit: true).new
        return b
    }()
    
    lazy var superLikeButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "electricity"), cornerRadius: 0, target: self, selector: #selector(superLike), sizeToFit: true).new
        return b
    }()
    
    lazy var fourth: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "love"), cornerRadius: 0, target: self, selector: #selector(like), sizeToFit: true).new
        return b
    }()
    
    lazy var fifth: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "star"), cornerRadius: 0, target: self, selector: #selector(superLike), sizeToFit: true).new
        return b
    }()
    
    lazy var container: UIStackView = {
        
        
        let c = UIStackView(arrangedSubviews: [
            self.likeButton, self.passButton, self.superLikeButton, self.fourth, self.fifth
        ])
        c.translatesAutoresizingMaskIntoConstraints = false
        c.spacing = 20
        c.distribution = .fillEqually
        return c
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpViews() {
        
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            container.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
    }

    @objc func like() {
        delegate?.like(button: likeButton)
    }

    @objc func pass() {
        delegate?.pass(button: passButton)
    }

    @objc func superLike() {
        delegate?.superLike(button: superLikeButton)
    }
    
    
}

protocol ButtonsDelegate: AnyObject{
    
    func like(button: UIButton)
    func pass(button: UIButton)
    func superLike(button: UIButton)
}
