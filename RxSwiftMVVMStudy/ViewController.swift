//
//  ViewController.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/7/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let imageUrl = "https://www.seriouseats.com/thmb/xw1krLC9Yh85qx1wl5jw0BPCWHk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2015__07__20210324-SouthernFriedChicken-Andrew-Janjigian-21-cea1fe39234844638018b15259cabdc2.jpg"
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.register(NormalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NormalCarouselCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
        setSnapShot()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.createBannerSection()
            case 1:
                return self?.createNormalCarouselSection()
//            case 2:
            default:
                return self?.createBannerSection()
            }
            
//            return self?.createBannerSection()
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
    
    private func createNormalCarouselSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
                cell.config(title: item.title, imageUrl: item.imageUrl)
                return cell
            case .normalCarousel(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCarouselCollectionViewCell.id, for: indexPath) as? NormalCarouselCollectionViewCell else { return UICollectionViewCell() }
                cell.config(imageUrl: item.imageUrl, title: item.title, subTitle: item.subTitle)
                return cell
            default:
                return UICollectionViewCell()
            }
            
            
        })
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([Section(id: "Banner")])
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌 치킨", imageUrl: imageUrl)),
            Item.banner(HomeItem(title: "굽네 치킨", imageUrl: imageUrl)),
            Item.banner(HomeItem(title: "푸라닭 치킨", imageUrl: imageUrl))
        ]
        snapshot.appendItems(bannerItems, toSection: Section(id: "Banner"))
        
        let normalSection = Section(id: "NormalCarousel")
        snapshot.appendSections([normalSection])
        let normalItems = [
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "교촌 치킨", subTitle: "간장 치킨", imageUrl: imageUrl))
        ]
        snapshot.appendItems(normalItems, toSection: normalSection)
        
        dataSource?.apply(snapshot)
    }
}
