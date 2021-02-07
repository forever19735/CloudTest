//
//  FirstViewController.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickButtonDidTapped(_ sender: UIButton) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
