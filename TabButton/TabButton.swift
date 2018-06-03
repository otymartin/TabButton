//
//  TabButton.swift
//  TabButton
//
//  Created by Martin Otyeka on 2018-06-03.
//  Copyright © 2018 New Capsule Corp. All rights reserved.
//

import UIKit
import Spring

public protocol TabButtonDelegate: class {
    
    func didTabTabButton(for page: TabPage)
}

public class TabButton: SpringButton {
    
    public var page: TabPage?
    
    public var tabTitle: String = "" {
        didSet {
            self.setTitle(self.tabTitle, for: .normal)
        }
    }
    
    public weak var delegate: TabButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}

extension TabButton {
    
    fileprivate func configure() {
        self.setTitleColor(.dark, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }
    
    @objc func Tap() {
        guard let page = self.page else { return }
        self.popUpPopIn(scale: 0.95)
        self.delegate?.didTabTabButton(for: page)
    }
    
    private var margin: CGFloat {
        return 16
    }
    
    public var width: CGFloat {
        return self.bounds.width
    }
    
    public var height: CGFloat {
        return self.bounds.height
    }
    
    public var halfOfWidth: CGFloat {
        return self.width.divided(by: 2)
    }
    
    public var halfOfHeight: CGFloat {
        return self.height.divided(by: 2)
    }
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var farLeft: CGFloat {
        return -(self.screenWidth - (self.halfOfWidth + self.margin))
    }
    
    public var centerLeft: CGFloat {
        return -(self.screenWidth.divided(by: 2).subtracting(self.halfOfWidth))
    }
    
    public var offLeft: CGFloat {
        return -(self.margin.adding(self.halfOfWidth))
    }
    
    public var lhs: CGFloat {
        return self.margin.adding(self.halfOfWidth)
    }
    
    public var tabCenter: CGFloat {
        return self.screenWidth.divided(by: 2)
    }
    
    public var rhs: CGFloat {
        return self.screenWidth.subtracting(self.margin.adding(self.halfOfWidth))
    }
    
    public var offRight: CGFloat {
        return self.screenWidth.adding(self.margin.adding(self.halfOfWidth))
    }
    
    public var centerRight: CGFloat {
        return self.screenWidth.adding(self.screenWidth.divided(by: 2).subtracting(self.halfOfWidth))
    }
    
    public var farRight: CGFloat {
        return self.screenWidth.multiplied(by: 2).subtracting(self.margin.adding(self.halfOfWidth))
    }
    
    public var farOffRight: CGFloat {
        return self.screenWidth.multiplied(by: 2).adding(self.margin.adding(self.halfOfWidth))
    }
    
    public var farCenterRight: CGFloat {
        return self.screenWidth.multiplied(by: 2) + self.screenWidth.divided(by: 2) + self.halfOfWidth
    }
}

public extension CGFloat {
    
    public func subtracting(_ value: CGFloat) -> CGFloat {
        return self - value
    }
    
    public func multiplied(by: CGFloat) -> CGFloat {
        return self * by
    }
    
    public func divided(by: CGFloat) -> CGFloat {
        return self / by
    }
    
    public func adding(_ value: CGFloat) -> CGFloat {
        return self + value
    }
}

