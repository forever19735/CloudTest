//
//  SecondCollectionViewCell.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import UIKit

struct SecondViewData {
    let id: Int
    let title: String
    let imageUrl: String
}

class SecondCollectionViewCell: UICollectionViewCell, ConfigCell {
    
    typealias ViewData = SecondViewData
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageURL: String? {
        didSet {
            if let url = imageURL {
                imageView.loadImageUsingCache(withUrl: url) { (image) in
                    if url == self.imageURL {
                        self.imageView.image = image
                    }
                }
            } else {
                self.imageView.image = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupWithViewData(viewData: SecondViewData) {
        titleLabel.text = "\(viewData.id)\n\(viewData.title)"
        imageURL = viewData.imageUrl
    }
}
