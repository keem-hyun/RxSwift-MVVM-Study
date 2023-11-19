//
//  Network.swift
//  RxSwiftMVVMStudy
//
//  Created by 김강현 on 11/19/23.
//

import Foundation
import RxSwift
import RxAlamofire

class Network<T:Decodable> {
    
    private let endpoint: String
    private let queue: ConcurrentDispatchQueueScheduler
    init(_ endpoint: String) {
        self.endpoint = endpoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    func getItemList(path: String) -> Observable<T> {
        let fullPath = "\(endpoint)\(path)?api_key=\(APIKEY)&language=ko"
        return RxAlamofire.data(.get, fullPath)
            .observe(on: queue)
            .debug()
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
}
