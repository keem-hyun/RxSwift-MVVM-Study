//
//  Item.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/14/23.
//

import Foundation

//섹션 및 아이템 정의
struct Section: Hashable {
    let id: String
}

enum Item: Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}

struct HomeItem: Hashable {
    let title: String
    let subTitle: String?
    let imageUrl: String
}
