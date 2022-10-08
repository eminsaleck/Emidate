//
//  HeaderView.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class HeaderViewForProfile: UICollectionReusableView {
    
  static let reuseIdentifier = "headerForProfile-reuse-identifier"

  let label = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension HeaderViewForProfile {
    func setup(_ item: String) {
        
    }
    
  func configure() {
    backgroundColor = .systemBackground
      self.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.adjustsFontForContentSizeCategory = true

    let inset = CGFloat(10)
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset - 10),
      label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
      label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
      label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
    ])
    label.font = UIFont.preferredFont(forTextStyle: .title3)
      label.font = UIFont.boldSystemFont(ofSize: 24)

  }
}
