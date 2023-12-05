//
//  ViewController.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/7/23.
//

import UIKit
import SnapKit
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let viewModel = ViewModel()
//   Subject - 이벤트를 발생시키면서 Observable 형태를 띔.
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        bindView()
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
    
    private func bindViewModel() {
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(), movieTrigger: movieTrigger.asObservable())
        
        let output = viewModel.transform(input: input)
        
        output.tvList.bind { tvList in
            print(tvList)
        }.disposed(by: disposeBag)
    }
    
    private func bindView() {
        buttonView.tvButton.rx.tap.bind { [weak self] in
            self?.tvTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }
    
}
