//
//  ViewModel.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 12/5/23.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
//        let movieList: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        input.tvTrigger.bind {
            print("Trigger")
        }.disposed(by: disposeBag)
        
        return Output(tvList: Observable<[TV]>.just([]))
    }
}
