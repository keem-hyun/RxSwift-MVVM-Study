//
//  ViewController.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/7/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(buttonView)
        self.view.addSubview(collectionView)
        
        buttonView.snp.makeConstraints({
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        })
        
        collectionView.snp.makeConstraints({
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(buttonView.snp.bottom)
        })
    }
    
}
