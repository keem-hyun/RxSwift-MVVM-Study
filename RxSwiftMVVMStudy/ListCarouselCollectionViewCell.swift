//
//  ListCarouselCollectionViewCell.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/19/23.
//

import UIKit
import SnapKit
import Kingfisher

class ListCarouselCollectionViewCell: UICollectionViewCell {
    static let id = "ListCarouselCell"
    private let mainImage = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI() {
        [mainImage, titleLabel, subTitleLabel].forEach({self.addSubview($0)})
        
        mainImage.snp.makeConstraints({
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(60)
        })
        
        titleLabel.snp.makeConstraints({
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(mainImage.snp.trailing).offset(8)
        })
        
        subTitleLabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(mainImage.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        })
    }
    
    func config(imageUrl: String, title: String, subTitle: String?) {
        mainImage.kf.setImage(with: URL(string: imageUrl))
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
