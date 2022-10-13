//
//  SwipeView.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 10.10.2022.
//

import UIKit

class SwipeCardView : UIView {
    
    //MARK: - Properties
    var swipeView : UIView!
    var shadowView : UIView!
    var imageView: UIImageView!
    
    var viewForButtons = UIView()
    
    var bottomCardView = BottomCardView()
    
    var delegate : SwipeCardsDelegate?
    
    var divisor : CGFloat = 0
    let baseView = UIView()
    
    let buttonsContainer: ButtonsView = {
        
        let view = ButtonsView()
        view.tag = 1005
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var dataSource : CardsDataModel? {
        didSet {
           // let item = dataSource?.item
          //  bottomCardView.setup(item)
            guard let image = dataSource?.image else { return }
            imageView.image = UIImage(named: image)
        }
    }

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureShadowView()
        configureSwipeView()
        configureViewForButtonsView()
        configureImageView()
        addPanGestureOnCards()
        configureTapGesture()
        configureButtonsContainer()
        configureBottomCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    
  
 
    
    func configureTapGesture() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
    
    
    func addPanGestureOnCards() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    
    
    //MARK: - Handlers
    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        sender.swipeView(sender.view!)
        
        let card = sender.view as! SwipeCardView
        
      
        
        switch sender.state {
            
        case .ended:
           
           
            if (card.center.x) > 400 {
                
                delegate?.swipeDidEnd(on: card, loveOrHate: true)
                
                return
            }else if card.center.x < -65 {
                
                delegate?.swipeDidEnd(on: card, loveOrHate: false)
                
                return
            }
            sender.center(card)
        default:
            break
        }
        return
    }
    
    
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer){
        
        
    }
    
    
}

extension SwipeCardView: ButtonsDelegate{
    func like(button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(translationX: 500, y: 0
            )
        } completion: { wetw in
            self.delegate?.swipeDidEnd(on: self, loveOrHate: true)
        }
        
    }
    
    func pass(button: UIButton) { UIView.animate(withDuration: 0.3) {
        self.transform = CGAffineTransform(translationX: -500, y: 0)
        } completion: { wetw in
        self.delegate?.swipeDidEnd(on: self, loveOrHate: false)
        }
    }
    
    func superLike(button: UIButton) {
        delegate?.swipeDidEnd(on: self, loveOrHate: false)
        
    }

}

// Configuration
extension SwipeCardView{
    
      func configureButtonsContainer(){
          addSubview(buttonsContainer)
          buttonsContainer.layer.zPosition = 1000
          buttonsContainer.delegate = self
          buttonsContainer.clipsToBounds = true
          buttonsContainer.layer.cornerRadius = 10
          buttonsContainer.backgroundColor = #colorLiteral(red: 0.4566403031, green: 0.8707435131, blue: 0.7716047168, alpha: 1)
          NSLayoutConstraint.activate([
              buttonsContainer.bottomAnchor.constraint(equalTo: swipeView.bottomAnchor, constant: -10),
              buttonsContainer.leadingAnchor.constraint(equalTo: swipeView.leadingAnchor, constant: 22),
              buttonsContainer.trailingAnchor.constraint(equalTo: swipeView.trailingAnchor, constant: -22
                                                        ),
              buttonsContainer.topAnchor.constraint(equalTo: viewForButtons.topAnchor)
          ])
      }
      
      func configureBottomCardView(){
          addSubview(bottomCardView)
          
          bottomCardView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              bottomCardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -60),
              bottomCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
              bottomCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
              bottomCardView.topAnchor.constraint(equalTo: topAnchor, constant: 450)
          ])
          
      }
      
      func configureShadowView() {
          shadowView = UIView()
          shadowView.backgroundColor = .clear
          shadowView.layer.shadowColor = UIColor.black.cgColor
          shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
          shadowView.layer.shadowOpacity = 0.8
          shadowView.layer.shadowRadius = 4.0
          addSubview(shadowView)
          
          shadowView.translatesAutoresizingMaskIntoConstraints = false
          shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
          shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
          shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
          shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
      }
      
      func configureSwipeView() {
          swipeView = UIView()
          swipeView.layer.cornerRadius = 15
          swipeView.clipsToBounds = true
          shadowView.addSubview(swipeView)
          
          swipeView.translatesAutoresizingMaskIntoConstraints = false
          swipeView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
          swipeView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
          swipeView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
          swipeView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
      }
      
      func configureViewForButtonsView() {  //-------------------
          swipeView.addSubview(viewForButtons)
         // label.backgroundColor = .clear

          viewForButtons.translatesAutoresizingMaskIntoConstraints = false
          viewForButtons.leftAnchor.constraint(equalTo: swipeView.leftAnchor).isActive = true
          viewForButtons.rightAnchor.constraint(equalTo: swipeView.rightAnchor).isActive = true
          viewForButtons.bottomAnchor.constraint(equalTo: swipeView.bottomAnchor).isActive = true
          viewForButtons.heightAnchor.constraint(equalToConstant: 60).isActive = true
          
      }
      
      func configureImageView() {
          imageView = UIImageView()
          swipeView.addSubview(imageView)
          imageView.contentMode = .scaleAspectFill
          imageView.translatesAutoresizingMaskIntoConstraints = false
          
          NSLayoutConstraint.activate([ imageView.bottomAnchor.constraint(equalTo: viewForButtons.topAnchor),
                                        imageView.trailingAnchor.constraint(equalTo: swipeView.trailingAnchor),
                                        imageView.topAnchor.constraint(equalTo: swipeView.topAnchor),
                                        imageView.leadingAnchor.constraint(equalTo: swipeView.leadingAnchor)])
         
      }
      
}
