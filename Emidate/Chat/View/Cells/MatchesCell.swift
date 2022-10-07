//
//  MatchesCell.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class MatchesCell: UICollectionViewCell {
    
    static var reuseId: String = "matchesCell"
    
    let imageView = UIImageView()
    let name = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)

        imageView.frame = self.bounds
        addSubview(imageView)
        self.layer.cornerRadius = imageView.frame.height / 2
        self.clipsToBounds = true
        imageView.layoutIfNeeded()

    }
    func setupElements() {
        name.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with chat: Chat) {
        imageView.image = UIImage(named: chat.image)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MatchesCell {
    func setupConstraints() {


    }
}
