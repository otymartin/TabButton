//
//  ViewController.swift
//  TabButton
//
//  Created by Martin Otyeka on 2018-06-03.
//  Copyright © 2018 New Capsule Corp. All rights reserved.
//

import UIKit
import SnapKit
import Pageboy

class ViewController: PageboyViewController {
    
    let button = TabButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        
    }
    
    private func addButton() {
        button.title = "Standing"
        button.page = .three
        button.secondTitle = NSAttributedString(string: "3💎",
                                                attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17, weight: .heavy),
                                                             NSAttributedStringKey.foregroundColor: UIColor.black])
        button.backgroundColor = .clear
        self.view.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
    }
}

extension ViewController: PageboyViewControllerDelegate {
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        self.button.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        self.button.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
    }
}
