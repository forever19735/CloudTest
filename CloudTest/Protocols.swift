//
//  Protocols.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import Foundation

protocol ConfigCell {
    associatedtype ViewData
    func setupWithViewData(viewData: ViewData)
}
public protocol JSONEmptyRepresentable {
  // 如果建立物件時會遇到 空 json {}，則需要提供自身的 coding keys
  associatedtype CodingKeyType: CodingKey
}

extension KeyedDecodingContainer {
    public func decodeIfPresent<T>(_ type: T.Type, forKey key: K) throws -> T? where T : Decodable & JSONEmptyRepresentable {
    // 先檢查有沒有我們要找的 frontCover key
    
    if contains(key) {
      // 有的話建立出 nested container
      // nested container 會根據我們要建立的 type 之中的 coding key type 產生
      let container = try nestedContainer(keyedBy: type.CodingKeyType.self,
                                          forKey: key)
      if container.allKeys.isEmpty {
        // 如果 container 中沒有任何 key，表示我們遇到 {}
        return nil
      }
    } else {
      // 沒有找到我們要的 key
      return nil
    }
    
    return try decode(T.self, forKey: key)
  }
}
