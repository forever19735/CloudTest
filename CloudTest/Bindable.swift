//
//  Bindable.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/6.
//  Copyright © 2021 johnlin. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
