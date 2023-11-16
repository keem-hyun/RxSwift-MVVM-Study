//
//  ViewController.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
//            cell.config(title: <#T##String#>, imageUrl: <#T##String#>)
            return cell
        })
    }
}
