//
//  ChatController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class ChatController: UIViewController {
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    let sections = Bundle.main.decode([Section].self, from: "model.json")
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Chat>!  = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        setupCollectionView()
        createDataSource()
        let snapshot = reloadData()
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    func setupCollectionView() {
        let cocollectionViewFrame = view.bounds.inset(by: UIEdgeInsets(top: 125, left: 0, bottom: 0, right: 0))
        collectionView = UICollectionView(frame: cocollectionViewFrame, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor =   #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        
        view.addSubview(collectionView)
        
        
        collectionView.register(MatchesCell.self, forCellWithReuseIdentifier: MatchesCell.reuseId)
        collectionView.register(ChatCell.self, forCellWithReuseIdentifier: ChatCell.reuseId)
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: ChatController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier)
        
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "story":
                return self.createMatchesSection()
            default:
                return self.createChatSection()
            }
        }
        
        return layout
    }
    
    func createMatchesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75),
                                              heightDimension: .fractionalHeight(0.75))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(104),
                                                     heightDimension: .estimated(88))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: ChatController.sectionHeaderElementKind,
            alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 25, trailing: 12)
        layoutSection.orthogonalScrollingBehavior = .continuous
        
        layoutSection.boundarySupplementaryItems = [sectionHeader]
        return layoutSection
    }
    
    func createChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: ChatController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 50, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
}
//MARK: DATASOURCE
extension ChatController{
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Chat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case "story":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchesCell.reuseId, for: indexPath) as? MatchesCell
                cell?.configure(with: chat)
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCell.reuseId, for: indexPath) as? ChatCell
                cell?.configure(with: chat)
                return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.reuseIdentifier,
                for: indexPath) as? HeaderView else { fatalError("Cannot create header view") }

            supplementaryView.label.text = self.sections[indexPath.section].title
            return supplementaryView
        }
        let snapshot = reloadData()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func reloadData() -> NSDiffableDataSourceSnapshot<Section, Chat>  {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Chat>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)

        }
        
        
        dataSource?.apply(snapshot)
        return snapshot
    }
    
}
