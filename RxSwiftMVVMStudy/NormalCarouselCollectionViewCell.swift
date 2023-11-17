//
//  NormalCaroselCollectionViewCell.swift
//  RxSwiftMVVMStudy
//
//  Created by Dalton Lee on 2023/11/17.
//

import UIKit
import SnapKit

class NormalCarouselCollectionViewCell: UICollectionViewCell {
    static let id = "NormalCarouselCell"
    
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
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        })
        
        titleLabel.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.mainImage.snp.bottom).offset(8)
        })
        
        subTitleLabel.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
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
