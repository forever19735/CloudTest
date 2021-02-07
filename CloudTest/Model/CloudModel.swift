//
//  CloudModel.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import Foundation

struct CloudModel: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

extension CloudModel {
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.albumId = try container.decodeIfPresent(Int.self, forKey: .albumId) ?? 0
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl) ?? ""
    }
}
