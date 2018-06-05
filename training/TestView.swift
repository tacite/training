//
//  TestView.swift
//  training
//
//  Created by David Tacite on 05/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//

import UIKit

class TestView: UIView {
    @IBOutlet var name: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        commonInit()
    }
    
    public static func instanceFromNib() -> UIView? {
        if let view = UINib(nibName: "TestView2", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as? UIView {
            return view
        }
        return UIView()
    }
}
