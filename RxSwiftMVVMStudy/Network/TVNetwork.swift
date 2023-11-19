//
//  TVNetwork.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/19/23.
//

import Foundation
import RxSwift

final class TVNetwork {
    private let network: Network<TVListModel>
    init(network: Network<TVListModel>) {
        self.network = network
    }
    
    func getTopRatedList() -> Observable<TVListModel> {
        return network.getItemList(path: "/tv/top_rated")
    }
}
