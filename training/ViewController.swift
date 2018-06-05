//
//  ViewController.swift
//  training
//
//  Created by David Tacite on 04/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    private var _mabite : String?
    
    //MARK: - Init View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = MFCoreDataManager.shared.removeAllObjectsWith(entity: "Coin")
        _ = MFCoreDataManager.shared.saveContext()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Private method


}

