//
//  BannerCollectionViewCell.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/14/23.
//

import UIKit
import SnapKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    private func setUI() {
        [backgroundImage, titleLabel].forEach({self.addSubview($0)})
        titleLabel.snp.makeConstraints({
            $0.center.equalToSuperview()
        })
        
        backgroundImage.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    public func config(title: String, imageUrl: String) {
        titleLabel.text = title
        let url = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
