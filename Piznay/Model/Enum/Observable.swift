//
//  Observable.swift
//  Piznay
//
//  Created by Dima Kahanets on 31.10.2023.
//

import Foundation

//#warning("Learn how generic works")
//class Observable<T> {
//    
//    private var listener: ((T?) -> Void)?
//    
//    var value: T? {
//        didSet {
//            DispatchQueue.main.async {
//                self.listener?(self.value)
//            }
//        }
//    }
//    
//    init(_ value: T? = nil) {
//        self.value = value
//    }
//    
//    func bind(_ listener: @escaping ((T?) -> Void)) {
//        listener(value)
//        self.listener = listener
//    }
//}
