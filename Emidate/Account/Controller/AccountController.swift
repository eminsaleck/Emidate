//
//  AccountController.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 07.10.2022.
//

import UIKit

class AccountController: UIViewController {
    
    static let sectionHeaderElementKind = "section-headerForHeader-element-kind"
    
    
    var dataSource: UICollectionViewDiffableDataSource<ProfileSection, Profile>!  = nil
    let sections = Bundle.main.decode([ProfileSection].self, from: "modelProfile.json")
    
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        createDataSource()
        let snapshot = reloadData()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func setupCollectionView() {
        let cocollectionViewFrame = view.bounds.inset(by: UIEdgeInsets(top: 125, left: 0, bottom: 0, right: 0))
        self.view.backgroundColor = UIColor.whiteApple
        collectionView = UICollectionView(frame: cocollectionViewFrame, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor =   #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.register(ProfileCell.self,
                                forCellWithReuseIdentifier: ProfileCell.reuseId)
        collectionView.register(SocialsCell.self,
                                forCellWithReuseIdentifier: SocialsCell.reuseId)
        collectionView.register(SettingsCell.self,
                                forCellWithReuseIdentifier: SettingsCell.reuseId)
        collectionView.register(PhotoCell.self,
                                forCellWithReuseIdentifier: PhotoCell.reuseId)
        
        
        collectionView.register(
            HeaderViewForProfile.self,
            forSupplementaryViewOfKind: AccountController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderViewForProfile.reuseIdentifier)
        
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]

            switch section.type {
            case "profile":
                return self.generateProfile()
                
            case "settings":
                return self.generateSettings()
            case "socials":
                return self.generateSocials()
            default:
                return self.generatePhotos()
            }
        }
        
        return layout
    }
}

//MARK: Layout
extension AccountController{
    func generateProfile() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AccountController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 34, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    func generateSettings() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AccountController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 34, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    func generateSocials() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AccountController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 34, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    func generatePhotos() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AccountController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 20, bottom: 34, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }

}
//MARK: DATASOURCE
extension AccountController{
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ProfileSection, Profile>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, items) -> UICollectionViewCell? in

            switch self.sections[indexPath.section].type {
            case "profile":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.reuseId, for: indexPath) as! ProfileCell
                cell.setup(items)
                print("cell - 1")
                return cell
            case "settings":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCell.reuseId, for: indexPath) as! SettingsCell
                cell.setup(items)
                print("cell - 2")

                return cell
            case "socials":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialsCell.reuseId, for: indexPath) as! SocialsCell
                cell.setup(items)
                print("cell - 3")

                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell

                cell.setup(items)
                return cell
            }
        })
        
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderViewForProfile.reuseIdentifier,
                for: indexPath) as? HeaderViewForProfile else { fatalError("Cannot create header view") }

            supplementaryView.label.text = self.sections[indexPath.section].title
            return supplementaryView
        }
        let snapshot = reloadData()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func reloadData() -> NSDiffableDataSourceSnapshot<ProfileSection, Profile>  {
        var snapshot = NSDiffableDataSourceSnapshot<ProfileSection, Profile>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)

        }
        
        
        dataSource?.apply(snapshot)
        return snapshot
    }
    
}



//
//
//
//



