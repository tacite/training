//
//  TestView3.swift
//  training
//
//  Created by David Tacite on 05/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//

import UIKit

protocol Clicked {
    func pressed(_ sender: Any)
}

class TestView3: UIView, Clicked {
    @IBOutlet weak var bouton: UIButton!
    var delegate : Clicked?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public static func instanceFromNib() -> UIView {
        if let view = UINib(nibName: "TestView3", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as? UIView {
            return view
        }
        return UIView()
    }
    
    @IBAction func pressed(_ sender: Any) {
        self.delegate?.pressed(sender)
    }
    
    
}
