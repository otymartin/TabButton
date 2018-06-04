//
//  ViewController.swift
//  TabButton
//
//  Created by Martin Otyeka on 2018-06-03.
//  Copyright © 2018 New Capsule Corp. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, TabButtonDelegate {
    
    let button = TabButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.title = "People"
        button.delegate = self
        button.page = .one
        button.secondTitle = NSAttributedString(string: "3💎", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17, weight: .heavy), NSAttributedStringKey.foregroundColor: UIColor.black])
        button.backgroundColor = .clear
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
    }
    
    func didTapTabButton(for page: TabPage) {
        print(page)
    }

}
