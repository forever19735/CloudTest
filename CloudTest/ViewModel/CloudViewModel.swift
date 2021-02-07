//
//  CloudViewModel.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import Foundation

class CloudViewModel {
    
    var data = Bindable<[CloudModel]>()
    func fetchData() {
        NetworkManager.shared.request(CloudAPI.getData, model: [CloudModel].self) { (result) in
            switch result {
            case .success(let content):
                self.data.value = content
            case .fail(let error):
                print(error)
            }
        }
    }
}
