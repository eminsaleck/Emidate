//
//  TabMenu.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit
class TabMenu: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        self.layer.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.tag = i
            self.addSubview(itemView)
            
            
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 2)
    }
    
    private func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        tabBarItem.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        
        tabBarItem.layer.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        tabBarItem.addSubview(itemIconView)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        
        tabBarItem.layer.addSublayer(createLayer())
        tabBarItem.setNeedsLayout()
        tabBarItem.layoutIfNeeded()
        
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 25),
            itemIconView.widthAnchor.constraint(equalToConstant: 25),
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 10),
            itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 20),
            
        ])
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    func createLayer() -> CAShapeLayer{
        
        let borderNonActive = CAShapeLayer()
        let borderNonActiveFrame = CGRect(x: 7.8, y: 1, width: 50, height: 45)
        borderNonActive.frame = borderNonActiveFrame
        let path = CGMutablePath()
        
        let petal = UIBezierPath(roundedRect: CGRect(x: 2.15, y: -0.5, width: 45, height: 45), cornerRadius: 10).cgPath
        path.addPath(petal)
        
        borderNonActive.path = path
        borderNonActive.strokeColor = UIColor.mainColor.cgColor
        borderNonActive.fillColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        borderNonActive.fillRule = .evenOdd
        borderNonActive.opacity = 1
        borderNonActive.zPosition = -1
        
        borderNonActive.shadowPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        borderNonActive.shadowRadius = 5
        borderNonActive.shadowOpacity = 0.2
        
        return borderNonActive
    }
    
    private func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        let borderWidth = tabToActivate.frame.size.width - 20
        let shadowSize: CGFloat = 6
        let shadowDistance: CGFloat = 15
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = UIBezierPath(roundedRect: CGRect(x: 10, y: 0, width: borderWidth, height: 45), cornerRadius: 10).cgPath
        borderLayer.fillColor = #colorLiteral(red: 0.2876360416, green: 0.9661642909, blue: 0.7776840329, alpha: 0.821747449)
        borderLayer.name = "active border"
        borderLayer.opacity = 0.8
        borderLayer.zPosition = -1
        
        
        let contactRect = CGRect(x: -shadowSize + 10, y: 35 - (shadowSize * 0.99) + shadowDistance, width: borderWidth + shadowSize * 2, height: shadowSize)
        borderLayer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        borderLayer.shadowRadius = 5
        borderLayer.shadowOpacity = 0.6
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    
    private func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                
                layersToRemove.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
