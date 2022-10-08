//
//  SettingsCell.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 08.10.2022.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    static var reuseId: String = "settingsCell"
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
    }

    required init?(coder: NSCoder) {
      fatalError()
    }
    func configure(){
        self.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
    }
    func setup(_ item: Profile) {
        
    }
}
